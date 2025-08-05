# Load necessary libraries
library(RSelenium)
library(dplyr)
library(stringr)
library(lubridate)

# Function to set up Chrome options with desired preferences
setup_chrome_options <- function(download_dir) {
  # Define Chrome options
  chrome_options <- list(
    chromeOptions = list(
      args = c(
        "--headless", # Run in headless mode
        "--disable-gpu",
        "--remote-allow-origins=*",
        "--window-size=1920,1080",
        "--no-sandbox",
        "--disable-search-engine-choice-screen",
        "--disable-dev-shm-usage"
      ),
      prefs = list(
        "download.default_directory" = download_dir, # Set download directory
        "download.prompt_for_download" = FALSE,      # Disable download prompt
        "download.directory_upgrade" = TRUE,
        "safebrowsing.enabled" = TRUE,
        "safebrowsing.disable_download_protection" = TRUE
      )
    )
  )
  
  return(chrome_options)
}

# Specify the download directory (ensure this directory exists)
download_directory <- normalizePath("./Downloads", winslash = "/")

# Set up Chrome options
chrome_profile <- setup_chrome_options(download_directory)

# Initialize RSelenium Remote Driver

# chromedriver --allowed-origins=* --port=40629  --enable-chrome-logs --log-level=INFO


rsDriver
remDr <- rsDriver(
  browser = "chrome", 
  geckover = NULL,
  iedrver = NULL,
  phantomver = NULL, 
  verbose = TRUE,
  extraCapabilities = chrome_profile, 
  port = 37261L)

remDr <- remoteDriver(
  extraCapabilities = chrome_profile, 
  port = 40629L)

# Open the Remote Driver
remDr$open()

chrome_ver(chromecheck[["platform"]], chromever)


# Define the target URL
target_url <- "https://consultaauditoria.saude.gov.br/visao/pages/principal.html?0"

# Define the years to iterate through
years <- 2023:2025

# Function to format dates in pt-BR format
format_pt_br <- function(date) {
  return(format(date, "%d/%m/%Y"))
}

# Function to wait for an element to be present
wait_for_element <- function(remDr, using, value, timeout = 10) {
  for (i in 1:timeout) {
    elements <- remDr$findElements(using = using, value = value)
    if (length(elements) > 0) {
      return(elements[[1]])
    }
    Sys.sleep(1)
  }
  stop(paste("Element not found:", using, value))
}

# Function to wait for a download to complete
wait_for_download <- function(download_dir, timeout = 120) {
  for (i in 1:timeout) {
    # Check for any .crdownload files (Chrome's temporary download files)
    tmp_files <- list.files(download_dir, pattern = "\\.crdownload$", full.names = TRUE)
    if (length(tmp_files) == 0) {
      # Additionally, check if there are any new files in the download directory
      # This is a simplistic check and may need refinement
      return(TRUE)
    }
    Sys.sleep(1)
  }
  return(FALSE)
}

# Loop through each year
for (year in years) {
  #year <- years[1]
  message(paste("Processing year:", year))
  
  # Navigate to the target URL
  remDr$navigate(target_url)
  
  # Allow the page to load
  Sys.sleep(3)
  
  # Fill the "comboOrgao" select field
  tryCatch({
    orgao_select <- wait_for_element(remDr, "id", "comboOrgao", timeout = 15)
    orgao_select$sendKeysToElement(list("21"))
    Sys.sleep(1) # Brief pause to allow options to update
  }, error = function(e) {
    message(paste("Error selecting comboOrgao for year", year, ":", e$message))
  })
  
  # Fill the "comboTipoAtividade" select field
  tryCatch({
    tipo_atividade_select <- wait_for_element(remDr, "id", "comboTipoAtividade", timeout = 15)
    tipo_atividade_select$sendKeysToElement(list("28"))
    Sys.sleep(1) # Brief pause to allow options to update
  }, error = function(e) {
    message(paste("Error selecting comboTipoAtividade for year", year, ":", e$message))
  })
  
  # Fill the "campoDtInicio" input field
  tryCatch({
    dt_inicio <- paste0("01/01/", year)
    campo_dt_inicio <- wait_for_element(remDr, "id", "campoDtInicio", timeout = 15)
    campo_dt_inicio$clearElement()
    campo_dt_inicio$sendKeysToElement(list(dt_inicio))
  }, error = function(e) {
    message(paste("Error setting campoDtInicio for year", year, ":", e$message))
  })
  
  # Fill the "campoDtFim" input field
  tryCatch({
    dt_fim <- paste0("31/12/", year)
    campo_dt_fim <- wait_for_element(remDr, "id", "campoDtFim", timeout = 15)
    campo_dt_fim$clearElement()
    campo_dt_fim$sendKeysToElement(list(dt_fim))
  }, error = function(e) {
    message(paste("Error setting campoDtFim for year", year, ":", e$message))
  })
  
  # Click the submit button ("botaoConsultar")
  tryCatch({
    submit_button <- wait_for_element(remDr, "name", "botaoConsultar", timeout = 15)
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
      next
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
      download_success <- wait_for_download(download_directory, timeout = 120)
      if (!download_success) {
        message(paste("Download did not complete within the expected time for year", year))
      }
      
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
