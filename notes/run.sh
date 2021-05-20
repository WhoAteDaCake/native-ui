export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/ubuntu/projects/native-ui/LCUI/lib"
export LIBRARY_PATH="$LIBRARY_PATH:/home/ubuntu/projects/native-ui/LCUI/lib"

rm LibLCUI.cr | true
crystal run src/main.cr -- examples/lib_lcui.cr >> LibLCUI.cr
# cp LibLCUI.cr /home/ubuntu/projects/native-ui/src