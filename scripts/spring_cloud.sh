#!/bin/sh

root="spring-cloud-example"
project_name="spring_cloud_register_eureka"
server_port=$2
spring_profiles_active=$3

function getProjects(){
  checkRootProject;
  cd ${root};
  allProjects=`ls`;
  echo ${allProjects}
  for project in ${allProjects};
  do
  if [ ${project} == ${project_name}  ]; then
    cd ${project_name}
    gradle assemble
  fi
  done
}

function checkRootProject(){
  cd ../../
  root_path=`ls`
  if echo "${root_path[@]}" | grep -w "${root}" &>/dev/null; then
  return 1
fi
  echo -e "not found ${root} \n please check path include \n${root_path}"
  exit 1
}

    getProjects

