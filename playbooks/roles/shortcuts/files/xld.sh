PS3='Please enter your choice: '
options=("8.1.0" "8.6.2" "9.0.5" "9.5.1")
select opt in "${options[@]}"
do
    case $opt in
        "8.1.0")
            echo "Version: 8.1.0"
            cd /opt/xebialabs/xl-deploy-8.1.0-server/bin && ./run.sh
            ;;
        "8.6.2")
            echo "Version: 8.6.2"
            cd /opt/xebialabs/xl-deploy-8.6.2-server/bin && ./run.sh
            ;;
        "9.0.5")
            echo "Version: 9.0.5"
            cd /opt/xebialabs/xl-deploy-9.0.5-server/bin && ./run.sh
            ;;
        "9.5.1")
            echo "Version: 9.5.1"
            cd /opt/xebialabs/xl-deploy-9.5.1-server/bin && ./run.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
