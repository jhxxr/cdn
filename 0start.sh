echo "==========================================="
echo "       欢迎使用自动推送github同步npm脚本"
echo "            双击打开即可使用"
echo "          作者: 星染"
echo "==========================================="
npmpath=$(cd "$(dirname "$0")"; pwd)
cd ${npmpath}
printf "\033[32m 文件根目录："${HexoPath}"\033[0m"
echo " "
echo "[0] 退出菜单"
echo "=============以下功能需要在所要上传的文件夹内使用================"
echo "[1] 开始上传"
echo " "
printf "选择："
read answer

if [ "$answer" = "1" ]; then
printf "\033[32m 开始上传\033[0m"
printf "将更改提交"
git add .
git commit -m "npm publish"
printf "更新package版本号"
npm version patch
printf "推送至github触发action"
git push
printf "上传成功"
else
if [ "$answer" = "0" ]; then
printf "\033[32mINFO \033[0m 欢迎下次光临！\n"
sleep 1s
exec ${npmpath}/0start.sh
else
printf "\033[31mERROR \033[0m 输入错误，请返回重新选择...\n"
sleep 1s
exec ${npmpath}/0start.sh
fi
fi