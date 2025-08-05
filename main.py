import os
import time
import polars as pl
from pathlib import Path
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select


# Define the download directory as a folder inside the project directory
download_directory = os.path.join(os.getcwd(), "Downloads")

# Create the download directory if it doesn't exist
if not os.path.exists(download_directory):
    os.makedirs(download_directory)

# Configure Firefox options for automatic downloads
firefox_options = webdriver.FirefoxOptions()
firefox_options.set_preference("pdfjs.disabled", True)
firefox_options.set_preference("browser.download.folderList", 2)
firefox_options.set_preference("browser.download.manager.showWhenStarting", False)
firefox_options.set_preference(
    "browser.download.dir", download_directory
)  # Set your download path
firefox_options.set_preference(
    "browser.helperApps.neverAsk.saveToDisk", "application/pdf"
)


df = pl.read_excel("lista de relatórios.xlsx", sheet_name="lista_relatorios")
relatorios = df.to_dicts()

# Initialize WebDriver
driver = webdriver.Firefox(options=firefox_options)
wait = WebDriverWait(driver, 10)

def prefix_files_in_directory(directory_path, prefix, start_with):
    """
    Renames all files in the specified directory that start with a given string by adding a prefix.

    Parameters:
        directory_path (str or Path): The path to the target directory.
        prefix (str): The prefix to add to the filenames.
        start_with (str): The string that filenames should start with to qualify for renaming.
    """
    # Convert to Path object if it's a string
    directory = Path(directory_path)

    # Check if the provided path is a directory
    if not directory.is_dir():
        raise NotADirectoryError(f"The path '{directory}' is not a valid directory.")

    # Iterate over all items in the directory
    for file_path in directory.iterdir():
        # Proceed only if it's a file and its name starts with the specified string
        if file_path.is_file() and file_path.name.startswith(start_with):
            # Construct the new filename by adding the prefix
            new_filename = prefix + file_path.name
            new_file_path = directory / new_filename

            # Check if the new filename already exists to prevent overwriting
            if new_file_path.exists():
                print(f"Skipping '{file_path.name}': '{new_filename}' already exists.")
                continue

            try:
                # Rename the file
                file_path.rename(new_file_path)
                print(f"Renamed '{file_path.name}' to '{new_filename}'.")
            except Exception as e:
                print(f"Failed to rename '{file_path.name}': {e}")

for relatorio in relatorios:
    # relatorio = relatorios[1]
    driver.get("https://consultaauditoria.saude.gov.br")

    wait.until(
        EC.presence_of_element_located(
            (By.NAME, "campoNumero")
        )
    )
    
    print(f"Baixando relatorio {relatorio["Nº"]} / {relatorio["Entidade Responsável"]}")
    
    driver.find_element(By.NAME, "campoNumero").click()
    driver.find_element(By.NAME, "campoNumero").send_keys(relatorio["Nº"])
    
    # Submit form
    driver.find_element(By.NAME, "botaoConsultar").click()
    
    # time.sleep(4)  # Wait for initial results

    wait.until(
        EC.presence_of_element_located(
            (By.CSS_SELECTOR, 'td[headers="numero"] > span')
        )
    )

    report_links = driver.find_elements(By.LINK_TEXT, "Relatório")
        
    n_report_links = len(report_links)

    for i in range(n_report_links):
        
        report_links = driver.find_elements(By.LINK_TEXT, "Relatório")
        
        actual_page = driver.find_element(By.CLASS_NAME, "span_texto_paginacao").text
        
        if not report_links:
            continue
        try:
            # Click Relatório link
            report_links[i].click()
            
            wait.until(EC.presence_of_element_located((By.NAME, "voltar")))

            # Find and click download link
            download_links = driver.find_elements(
                By.XPATH, '//a/img[@src="../../common/images/download.gif"]/..'
            )
            
            for download_link in download_links:
                download_link.click()
                time.sleep(1)  # Wait for download to start

            prefix_files_in_directory(download_directory, "Relat", str(relatorio["Nº"]) + "_")   
                   
        except Exception as e:
            print(f"Error processing row: {str(e)}")
            # driver.back()
            continue



driver.quit()
