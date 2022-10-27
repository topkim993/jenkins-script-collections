MARKETING_VERSION=$(cat ./SampleApp.xcodeproj/project.pbxproj | grep -m1 'MARKETING_VERSION' | cut -d'=' -f2 | tr -d ';' | tr -d ' ')
CURRENT_PROJECT_VERSION=$(cat ./SampleApp.xcodeproj/project.pbxproj | grep -m1 'CURRENT_PROJECT_VERSION' | cut -d'=' -f2 | tr -d ';' | tr -d ' ')
echo APP_VERSION="${MARKETING_VERSION}(${CURRENT_PROJECT_VERSION})" > ./temp.properties