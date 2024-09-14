# space-keycloak-theme
KeyCloak theme for Space

## Prerequisite

Clone the Space-Keycloak source project from "https://github.com/space-lex/space-keycloak-core.git" using branch "development".

Use command **mvn clean install -DskipTests** to build the project.

Then go to **services/target** folder and copy the **keycloak-services-11.0.0.jar** Jar file.

Now go to keycloak folder, open folder **modules/system/layers/keycloak/org/keycloak/keycloak-services/main** and replace the keycloak-services jar with the above jar.

Now add the following environment variables to configure the Guest Login :
1. **keycloak_guest_enable** (Set to "true" to enable the Guest Login Button. Disabled by default.)
2. **keycloak_guest_username** (keycloak Username for Guest Login)
3. **keycloak_guest_password** (keycloak Password for Guest Login)

Run the below command within the keycloak folder to start it.
```
./bin/standalone.sh
```

## Install

Copy the repository on your keyloak themes folder

```
cd keycloak/themes/space
git clone https://github.com/space-lex/space-keycloak-theme.git
```

## Preview

![Screen Shot](/preview/Screenshot1.png)
