PS3='Please enter your choice: '
options=("Arrancar máquinas virtuales (calculator)" "Detener máquinas virtuales (calculator)" "Arrancar máquinas virtuales (docker engines)" "Detener máquinas virtuales (docker engines)" "Arrancar máquinas virtuales (kubernetes)" "Detener máquinas virtuales (kubernetes)")
select opt in "${options[@]}"
do
    case $opt in
        "Arrancar máquinas virtuales (calculator)")
            for env in dev pre pro
            do
                cd /home/jcla/Projects/virtual-machines/congruencias-${env}
                vagrant up
            done
            echo "Máquina virtual en entorno ${env} arrancada"
            ;;
        "Detener máquinas virtuales (calculator)")
            for env in dev pre pro
            do
                cd /home/jcla/Projects/virtual-machines/congruencias-${env}
                vagrant halt
            done
            echo "Máquina virtual en entorno ${env} detenida"
            ;;
        "Arrancar máquinas virtuales (docker engines)")
            for env in dev pre pro
            do
                docker-machine start docker-${env}
                port=`docker-machine inspect --format='{{.Driver.SSHPort}}' docker-${env}`
                ssh -o "StrictHostKeyChecking=no" docker@localhost -p ${port} -i ~/.docker/machine/machines/docker-${env}/id_rsa 'sudo -- sh -c "echo 10.0.2.2 lyhsoft-registry >> /etc/hosts"'
            done
            ;;
        "Detener máquinas virtuales (docker engines)")
            for env in dev pre pro
            do
                docker-machine stop docker-${env}
            done
            ;;
        "Arrancar máquinas virtuales (kubernetes)")
            cd /home/jcla/Projects/kubernetes/vagrant-provisioning
            vagrant up
            sleep 60
            cd /opt/xebialabs/xl-deploy-9.0.5-cli/bin/
            ./cli.sh -f /home/jcla/Projects/xld-scripts/voting-app-k8s/deployXLDVotingAppK8s.py
            ;;
        "Detener máquinas virtuales (kubernetes)")
            cd /opt/xebialabs/xl-deploy-9.0.5-cli/bin/
            ./cli.sh -f /home/jcla/Projects/xld-scripts/voting-app-k8s/undeployXLDVotingAppK8s.py
            sleep 30
            cd /home/jcla/Projects/kubernetes/vagrant-provisioning
            vagrant halt
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
