#!/bin/sh
# 脚本名称
SCRIPT="$0"
# 项目名称
PROJECT="${1//_/-}"
# 项目目录
PROJECT_DIR="$1"
# 启动环境
PROFILE="$2"
COMMAND="$3"
# 根目录编译路径预处理 用于清除上次残留
function prepareBuildDir(){
  if [  -d "target" ]; then
   rm -rf target
   echo "******target dir cleaned******"
  fi
  gradle ":${PROJECT}:clean"
  mkdir -p target/package
}
# 导出gradle编译好的jar包到根项目target/package目录下
function exportGradleBuild(){
 gradle ":${PROJECT}:assemble"
 echo "******project jar prepare complete******"
 projectJar=`find "${PROJECT_DIR}/build/libs/" -name *.jar`
  cp -r  "${projectJar}"  "target/package"
  echo "******copy project jar ${projectJar} to target success******"
}

function getServicePid(){
  local pids=`ps -C java -f --width 1000 | grep "$projectJar" | awk '{print $2}'`
  echo "$pids"
}

# 预处理并导出jar包到根目录
function buildAndCopy(){
prepareBuildDir
exportGradleBuild
}
# 直接运行服务
function serviceRun(){
 local pids=$(getServicePid)
 if [ pids ];then
 echo "service ${PROJECT} is started width $pids please stop first"
 exit 1
fi

projectJar=`find "${PROJECT_DIR}/build/libs/" -name *.jar`
java -jar "${projectJar}" "--spring.profiles.active=${PROFILE}"
}

function stopService(){
local pids=$(getServicePid)
if [ !pids ];then
echo "service ${PROJECT} is not running"
exit 1



fi

kill -PIDS
}

echo -e "******script:${SCRIPT}****** \n ******project:${PROJECT}****** \n ******project_dir:${projectDir}******"
cd ..
workspace=`pwd`
echo "******root_project:${workspace}******"
buildAndCopy
if [ COMMAND ];then
echo "******project $COMMAND use ${PROFILE}******"
serviceRun
fi
echo "******${PROJECT} project build success******"

