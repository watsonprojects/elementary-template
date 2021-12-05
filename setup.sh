# Get app name
read -p "Enter app name with intended capitalisation: " appName
appNameLower=`echo $appName | tr '[:upper:]' '[:lower:]'`
appNameLower=`echo $appNameLower | sed 's/ /-/g'`
# Get user name
read -p "Enter github username: " userName
userName=`echo $userName | tr '[:upper:]' '[:lower:]'`
# Get legal name
read -p "Enter the name you want in copyright notices: " legalName
# Get email
read -p "Enter email address you want in copyright notices: " legalEmail

# Replace all instances of appName in files
find . -type f -not -path '*/\.*' -not -name "setup.sh" -exec sed -i "s/{{APP_NAME}}/$appName/g" {} +
find . -type f -not -path '*/\.*' -not -name "setup.sh" -exec sed -i "s/{{APP_NAME_LOWER}}/$appNameLower/g" {} +
# Replace all instances of userName in files
find . -type f -not -path '*/\.*' -not -name "setup.sh" -exec sed -i "s/{{USER_NAME}}/$userName/g" {} +
# Replace all instances of legalName in files
find . -type f -not -path '*/\.*' -not -name "setup.sh" -exec sed -i "s/{{LEGAL_NAME}}/$legalName/g" {} +
# Replace all instances of legalEmail in files
find . -type f -not -path '*/\.*' -not -name "setup.sh" -exec sed -i "s/{{LEGAL_EMAIL}}/$legalEmail/g" {} +

# Rename all needed files
mv data/com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}.desktop.in "data/com.github.$userName.$appNameLower.desktop.in"
mv data/com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}.appdata.xml.in "data/com.github.$userName.$appNameLower.appdata.xml.in"
# Icons too
mv data/icons/16/com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}.svg "data/icons/16/com.github.$userName.$appNameLower.svg"
mv data/icons/24/com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}.svg "data/icons/24/com.github.$userName.$appNameLower.svg"
mv data/icons/32/com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}.svg "data/icons/32/com.github.$userName.$appNameLower.svg"
mv data/icons/48/com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}.svg "data/icons/48/com.github.$userName.$appNameLower.svg"
mv data/icons/64/com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}.svg "data/icons/64/com.github.$userName.$appNameLower.svg"
mv data/icons/128/com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}.svg "data/icons/128/com.github.$userName.$appNameLower.svg"

echo "Done!"