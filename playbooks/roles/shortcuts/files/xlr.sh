PS3='Please enter your choice: '
options=("9.0.6" "9.5.0" "9.5.2")
select opt in "${options[@]}"
do
    case $opt in
        "9.0.6")
            echo "Version: 9.0.6"
            cd /opt/xebialabs/xl-release-9.0.6-server/bin && ./run.sh
            ;;
        "9.5.0")
            echo "Version: 9.5.0"
            cd /opt/xebialabs/xl-release-9.5.0-server/bin && ./run.sh
            ;;
        "9.5.2")
            echo "Version: 9.5.2"
            cd /opt/xebialabs/xl-release-9.5.2-server/bin && ./run.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
