
# BLUM BOT

## Description

This project is a bot designed to automate certain tasks. Before running the bot, ensure that you have set up the required environment and configuration files.

## Requirements

- Python 3.10.x  // https://www.python.org/downloads/release/python-3108/
- Git		// https://git-scm.com/downloads			

## Obtaining API Keys **IMPORTANT
1. Go to my.telegram.org and log in using your phone number.
2. Select "API development tools" and fill out the form to register a new application.
3. Record the API_ID and API_HASH provided after registering your application in the .env file.


## Setup Instructions

1. **Clone the Repository**  
   Clone this repository to your local machine using:
   ```bash
   git clone https://github.com/lumanix12/BlumBotFullOto
   cd BlumBotFullOto
   ```

2. **Setup `Setup.bat`**  
   Double-click on `Setup.bat` to initiate the setup process. **Do not close the command window during this process.**

3. **Environment Setup**  
   - If you don't have a `.env` file, the script will prompt you to update the `.env-example` file with your API_ID and API_HASH. After updating, confirm to proceed.
   - The script will create a `.env` file from `.env-example` if it does not already exist.

4. **Custom Payload Server**  
   During the execution of `run.bat`, the script will also clone the repository from [BlumPayloadGenerator](https://github.com/KobaProduction/BlumPayloadGenerator) and run the `start.bat` file. This step is crucial for setting up the **CUSTOM_PAYLOAD_SERVER_URL**.

5. **Start the Bot**  
   After the setup, the script will launch the bot by executing `python main.py`. 

6. **Add Accounts**  
   Once the bot Setup, you will need to add accounts by running the **Create season** function. After adding the accounts, you must `run.bat`.

7. **Run Clicker**  
   You will then select the **Run clicker** option to start the bot operations.

## Important Notes
- Make sure to keep the command window open while the bot is running.
- If there are any errors, follow the prompts for troubleshooting.

