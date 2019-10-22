bash 'run maven' do
    code <<-EOH
        cd /home/cloud_user/demo-base-spring-petclinic
            mvn tomcat7:run
                EOH
end
