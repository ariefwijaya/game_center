#!/bin/bash
usage="$(basename "$0") [[-h]] [[-c]] [[-u]] [[-g]] [[-b]] [[-x]] -- Script to generate build_runner and update localizations

where:
    -h  show this help text
    -c Do flutter clean and pub get (default: false)
    -g Generate Localization key (default: false)
    -b Generate Build Runner (default: false)
    -x Enable All" 
    

clean_pubget="false"
update_localization="false"
generate_localization="false"
generate_build_runner="false"

while getopts xhc:u:g:b: arg; do
    case $arg in
        h) echo "$usage"
           exit 0
           ;;
        x) clean_pubget="true"
           update_localization="true"
           generate_localization="true"
           generate_build_runner="true"
           break
           ;;
        c) clean_pubget=$OPTARG;;
        g) generate_localization=$OPTARG;;
        b) generate_build_runner=$OPTARG;;
    esac
done

if [[ $update_localization = "true" ]] 
then
    cd "$(dirname "$0")"
    cd _localization_gen
    npm install
    node index 'in/langs.csv' -p '../assets/localization' -s
    cd ../
fi

if ! command -v fvm &> /dev/null
then
    if [[ $clean_pubget = "true" ]] 
    then
        flutter clean
        flutter pub get
    fi
    if [[ $generate_build_runner = "true" ]] 
    then
        flutter pub run build_runner build --delete-conflicting-outputs
    fi
    if [[ $generate_localization = "true" ]] 
    then
        flutter pub run easy_localization:generate -S "assets/localization" -f keys -O "lib/constant" -o "localizations.g.dart"
    fi
    
else
    if [[ $clean_pubget = "true" ]] 
    then
        fvm flutter clean
        fvm flutter pub get
    fi
    if [[ $generate_build_runner = "true" ]] 
    then
        fvm flutter pub run build_runner build --delete-conflicting-outputs
    fi
    if [[ $generate_localization = "true" ]] 
    then
        fvm flutter pub run easy_localization:generate -S "assets/localization" -f keys -O "lib/constant" -o "localizations.g.dart"
    fi
fi

#To generate code coverages
#brew instal lcov
#genhtml -o coverage coverage/lcov.info
