#!/usr/bin/env bash

set -e

cat <<'EOF'
 .----------------.  .----------------.  .----------------.  .----------------.  .-----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| | ____    ____ | || |      __      | || | ____   ____  | || |  _________   | || | ____  _____  | |
| ||_   \  /   _|| || |     /  \     | || ||_  _| |_  _| | || | |_   ___  |  | || ||_   \|_   _| | |
| |  |   \/   |  | || |    / /\ \    | || |  \ \   / /   | || |   | |_  \_|  | || |  |   \ | |   | |
| |  | |\  /| |  | || |   / ____ \   | || |   \ \ / /    | || |   |  _|  _   | || |  | |\ \| |   | |
| | _| |_\/_| |_ | || | _/ /    \ \_ | || |    \ ' /     | || |  _| |___/ |  | || | _| |_\   |_  | |
| ||_____||_____|| || ||____|  |____|| || |     \_/      | || | |_________|  | || ||_____|\____| | |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
EOF

rm -rf ~/.m2/repository/com/example/
./mvnw clean install

cat <<'EOF'
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |    ______    | || |  _______     | || |      __      | || |  ________    | || |   _____      | || |  _________   | |
| |  .' ___  |   | || | |_   __ \    | || |     /  \     | || | |_   ___ `.  | || |  |_   _|     | || | |_   ___  |  | |
| | / .'   \_|   | || |   | |__) |   | || |    / /\ \    | || |   | |   `. \ | || |    | |       | || |   | |_  \_|  | |
| | | |    ____  | || |   |  __ /    | || |   / ____ \   | || |   | |    | | | || |    | |   _   | || |   |  _|  _   | |
| | \ `.___]  _| | || |  _| |  \ \_  | || | _/ /    \ \_ | || |  _| |___.' / | || |   _| |__/ |  | || |  _| |___/ |  | |
| |  `._____.'   | || | |____| |___| | || ||____|  |____|| || | |________.'  | || |  |________|  | || | |_________|  | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
EOF

rm -rf ~/.m2/repository/com/example/

function build() {
    local folder="${1}"
    echo -e "\n\nBuilding ${folder}\n\n"
    cd "${folder}"
    ./gradlew clean build publishToMavenLocal
    cd ..
}

echo -e "\n\nBuilding beer_contracts\n\n"
cd beer_contracts
./mvnw clean install
cd ..

build producer
build producer_with_external_contracts
build producer_with_restdocs
build consumer
build consumer_with_restdocs