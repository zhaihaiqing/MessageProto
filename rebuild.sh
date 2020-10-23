COMPILE_PATH=.Rebuild
echo "current branch:${CI_COMMIT_REF_NAME}"

rm -rf ${COMPILE_PATH}
mkdir ${COMPILE_PATH}
cd ${COMPILE_PATH}
# 下载MessageProto
echo "step1: clone MessageProto..."
git clone -b ${CI_COMMIT_REF_NAME} http://git.thunics.org/dp/MessageProto.git
# 下载wsn-data
echo "step2: clone wsn-data..."
git clone -b master http://git.thunics.org/embedded/wsn-data.git

# 校验
echo "step3: check MessageProto"
/home/work/bstack2proto3/BStack2Proto3 > result.txt

# 更新git仓库
RESULT=`awk '$1 ~ /congratulation/ {print "yes"}' result.txt`
if [ "${RESULT}" == "yes" ]; then
    echo "MessageProto check success"
    cd MessageProto/
    git push
    exit 0
else
  echo "MessageProto check failed"
  cat result.txt
  exit 1
fi
