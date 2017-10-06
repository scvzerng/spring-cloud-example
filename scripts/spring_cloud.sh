#!/bin/sh
# 脚本名称
script="${0}"
# 项目名称
project="${1//_/-}"
# 项目目录
projectDir="${1}"
# 启动环境
profiles="${2}"
# 根目录编译路径预处理 用于清除上次残留
function prepareBuildDir(){
  if [  -d "target" ]; then
   rm -rf target
   echo "******target dir cleaned******"
  fi
  gradle ":${project}:clean"
  mkdir -p target/package
}
# 导出gradle编译好的jar包到根项目target/package目录下
function exportGradleBuild(){
 gradle ":${project}:assemble"
 echo "******project jar prepare complete******"
 projectJar=`find "${projectDir}/build/libs/" -name *.jar`
  cp -r  "${projectJar}"  "target/package"
  echo "******copy project jar ${projectJar} to target success******"
}

# 预处理并导出jar包到根目录
function buildAndCopy(){
prepareBuildDir
exportGradleBuild
}
# 直接运行服务
function serviceRun(){
projectJar=`find "${projectDir}/build/libs/" -name *.jar`
java -jar "${projectJar}" "--spring.profiles.active=${profiles}"
}

echo -e "******script:${script}****** \n ******project:${project}****** \n ******project_dir:${projectDir}******"
cd ..
workspace=`pwd`
echo "******root_project:${workspace}******"
buildAndCopy
if [ $profiles ];then
echo "******project start use ${profiles}******"
serviceRun
fi
echo "******${project} project build success******"

