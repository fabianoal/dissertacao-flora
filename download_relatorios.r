# Load necessary libraries
library(RSelenium)
library(dplyr)
library(stringr)
library(lubridate)
# install.packages("RSelenium")
# Function to set up Firefox profile with desired preferences
setup_firefox_profile <- function(download_dir) {
  # Create a Firefox profile
  fprof <- makeFirefoxProfile(list(
    "browser.download.folderList" = 2, # Use custom download path
    "browser.download.dir" = download_dir,
    "browser.helperApps.neverAsk.saveToDisk" = "application/octet-stream,application/vnd.ms-excel,text/csv,application/pdf",
    "pdfjs.disabled" = TRUE, # Disable built-in PDF viewer
    "browser.download.manager.showWhenStarting" = FALSE,
    "browser.download.useDownloadDir" = TRUE,
    "browser.download.manager.focusWhenStarting" = FALSE,
    "browser.download.manager.alertOnEXEOpen" = FALSE,
    "browser.download.manager.closeWhenDone" = TRUE,
    "browser.download.manager.showAlertOnComplete" = FALSE,
    "browser.download.manager.useWindow" = FALSE
  ))
  return(fprof)
}

# Specify the download directory (you can change this to your desired path)
download_directory <- normalizePath("./Downloads", winslash = "/")

# Set up Firefox profile
firefox_profile <- setup_firefox_profile(download_directory)

# Start RSelenium with Firefox
rD <- rsDriver(browser = "firefox",
               port = 4545L,
               verbose = FALSE,
               extraCapabilities = firefox_profile)

remDr <- rD$client

# Define the target URL
target_url <- "https://consultaauditoria.saude.gov.br/visao/pages/principal.html?0"

# Define the years to iterate through
years <- 2023:2025

# Function to format dates in pt-BR format
format_pt_br <- function(date) {
  return(format(date, "%d/%m/%Y"))
}

# Loop through each year
for (year in years) {
  # Navigate to the target URL
  remDr$navigate(target_url)
  
  # Allow the page to load
  Sys.sleep(3)
  
  # Fill the "comboOrgao" select field
  tryCatch({
    orgao_select <- remDr$findElement(using = "id", value = "comboOrgao")
    orgao_select$sendKeysToElement(list("21"))
  }, error = function(e) {
    message(paste("Error selecting comboOrgao for year", year, ":", e$message))
  })
  
  # Fill the "comboTipoAtividade" select field
  tryCatch({
    tipo_atividade_select <- remDr$findElement(using = "id", value = "comboTipoAtividade")
    tipo_atividade_select$sendKeysToElement(list("28"))
  }, error = function(e) {
    message(paste("Error selecting comboTipoAtividade for year", year, ":", e$message))
  })
  
  # Fill the "campoDtInicio" input field
  tryCatch({
    dt_inicio <- paste0("01/01/", year)
    campo_dt_inicio <- remDr$findElement(using = "id", value = "campoDtInicio")
    campo_dt_inicio$clearElement()
    campo_dt_inicio$sendKeysToElement(list(dt_inicio))
  }, error = function(e) {
    message(paste("Error setting campoDtInicio for year", year, ":", e$message))
  })
  
  # Fill the "campoDtFim" input field
  tryCatch({
    dt_fim <- paste0("31/12/", year)
    campo_dt_fim <- remDr$findElement(using = "id", value = "campoDtFim")
    campo_dt_fim$clearElement()
    campo_dt_fim$sendKeysToElement(list(dt_fim))
  }, error = function(e) {
    message(paste("Error setting campoDtFim for year", year, ":", e$message))
  })
  
  # Click the submit button ("botaoConsultar")
  tryCatch({
    submit_button <- remDr$findElement(using = "name", value = "botaoConsultar")
    submit_button$clickElement()
  }, error = function(e) {
    message(paste("Error clicking submit button for year", year, ":", e$message))
  })
  
  # Wait for 4 seconds to allow results to load
  Sys.sleep(4)
  
  # Initialize pagination
  more_pages <- TRUE
  
  while (more_pages) {
    # Wait for the table to be present
    Sys.sleep(2)
    
    # Find the results table
    tryCatch({
      table_element <- remDr$findElement(using = "css selector",
                                        value = "div.container_16.marginTop20.positionR > table")
    }, error = function(e) {
      message(paste("Error finding results table for year", year, ":", e$message))
      return(NULL)
    })
    
    # Get all rows in the table body
    tryCatch({
      rows <- table_element$findChildElements(using = "css selector", value = "tbody > tr")
    }, error = function(e) {
      message(paste("Error finding table rows for year", year, ":", e$message))
      rows <- list()
    })
    
    # Iterate through each row
    for (row in rows) {
      # Find the "Relatório" link in the row
      tryCatch({
        report_link <- row$findChildElement(using = "xpath",
                                            value = ".//td/a[text()='Relatório']")
        report_link$clickElement()
      }, error = function(e) {
        message(paste("Error clicking 'Relatório' link for year", year, ":", e$message))
        next
      })
      
      # Wait for the new page to load
      Sys.sleep(3)
      
      # Find the download link (a tag with child img src="../../common/images/download.gif")
      tryCatch({
        download_link <- remDr$findElement(using = "xpath",
                                          value = "//a[img[@src='../../common/images/download.gif']]")
        download_link$clickElement()
      }, error = function(e) {
        message(paste("Error clicking download link for year", year, ":", e$message))
      })
      
      # Wait for the download to complete
      Sys.sleep(5)
      
      # Click the "voltar" button to go back
      tryCatch({
        voltar_button <- remDr$findElement(using = "name", value = "voltar")
        voltar_button$clickElement()
      }, error = function(e) {
        message(paste("Error clicking 'voltar' button for year", year, ":", e$message))
      })
      
      # Wait for the original page to load
      Sys.sleep(2)
    }
    
    # Check for the "next page" button
    tryCatch({
      next_page <- remDr$findElement(using = "xpath",
                                     value = "//a[span[@class='controlNext']]")
      # If found, click it to go to the next page
      next_page$clickElement()
      # Wait for the next page to load
      Sys.sleep(3)
    }, error = function(e) {
      # If not found, no more pages
      more_pages <- FALSE
      message(paste("No more pages for year", year, ". Moving to next year."))
    })
  }
}

# Close the RSelenium client and server
remDr$close()
rD$server$stop()

# Optional: Remove the temporary geckodriver and other temporary files created by RSelenium
# This step may vary depending on your RSelenium setup
