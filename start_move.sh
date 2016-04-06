#!/bin/bash

ORIGIN_CODE_PATH=$1
RESULT=${ORIGIN_CODE_PATH}_thirdparty

if [ -z $1 ];then
        echo "useage: $0 code_path"
		read -p "Or you want to download code to ~/temp/sourcecode?(Y/N):" OPTION
		echo "$OPTION"
        case $OPTION in
        Y) 
		   echo "start download code...."
		   mkdir -p ~/temp/sourcecode
		   cd ~/temp/sourcecode
		   repo init -u ssh://androidtd-tech.huawei.com/enterprisenetwork/venus/platform/manifest.git -b venus 1>/dev/null
		   $?=1
           while [ $? -ne 0 ]
           do 
		   repo sync -c -j4 1>/dev/null
           done
		   ORIGIN_CODE_PATH=~/temp/sourcecode
	    ;;
        N) echo "Abort!"
           exit 2
		;;

esac

fi

#prepare
mkdir -p $RESULT/1/cust_apks $RESULT/1/cust_buildset_se_pro $RESULT/1/cust_custres $RESULT/1/ep820_40_codehome
mkdir -p $RESULT/2/ep820_40_codehome_hk $RESULT/2/ep820_40_codehome_lnpst $RESULT/2/ep820_40_external2
mkdir -p $RESULT/3/ep820_40_external_chromiumorg_excepthirdparty $RESULT/3/ep820_40_external_thirdparty/thirdparty
mkdir -p $RESULT/4/ep820_40_prebuiltsndk4/current $RESULT/4/ep820_40_vendor_windriver1
mkdir -p $RESULT/5/ep820_40_external3
mkdir -p $RESULT/6/ep820_40_external1
mkdir -p $RESULT/7/ep820_40_packetsapps1 $RESULT/7/ep820_40_packetsapps2
mkdir -p $RESULT/8/ep820_40_prebuiltsndk1 $RESULT/8/ep820_40_prebuiltsother3 
mkdir -p $RESULT/9/ep820_40_prebuiltsndk2 $RESULT/9/ep820_40_prebuiltsndk3
mkdir -p $RESULT/10/ep820_40_vendor $RESULT/10/ep820_40_vendor_external $RESULT/10/ep820_40_vendor_hisi $RESULT/10/ep820_40_vendor_modem
mkdir -p $RESULT/11/ep820_40_vendor_vxworks1
mkdir -p $RESULT/12/ep820_40_vendor_vxworks2
mkdir -p $RESULT/13/ep820_40_vendor_windriver2
mkdir -p $RESULT/14/ep820_40_devi_frame $RESULT/14/ep820_40_packets3

cd $ORIGIN_CODE_PATH
find . -name *.git | xargs rm -rf
find . -type l | xargs rm -rf
rm -rf .repo

echo "start move..."

#folder 1
mv apks_storm $RESULT/1/cust_apks/
mv products  security  $RESULT/1/cust_buildset_se_pro/
mv custres $RESULT/1/cust_custres/
mv docs    bionic    build  ci_scripts   art   autotest cts  bootable   dalvik  development   developers  $RESULT/1/ep820_40_codehome/

#folder 2
mv k3-ci   hardware   kernel/arch/    kernel/fs   kernel/include   kernel/Documentation   kernel/drivers   $RESULT/2/ep820_40_codehome_hk/
mv tools    sdk  pdk   system/core     libcore    ndk    $RESULT/2/ep820_40_codehome_lnpst/
mv external/l*    $RESULT/2/ep820_40_external2/

#folder 3
mv external/chromium_org    $RESULT/3/ep820_40_external_chromiumorg_excepthirdparty/
mv $RESULT/3/ep820_40_external_chromiumorg_excepthirdparty/external/chromium_org/third_party/*   $RESULT/3/ep820_40_external_thirdparty/thirdparty/

#folder 4
mv prebuilts/ndk/9/* $RESULT/4/ep820_40_prebuiltsndk4/current/
mv vendor/hisi/modem/system/vxworks/WindRiver/docs  $RESULT/4/ep820_40_vendor_windriver1/

#folder 5
mv external/m* external/n* external/o* external/p* external/q* external/r* external/s* external/t* external/u* external/v* external/w* external/x* external/y* external/z* $RESULT/5/ep820_40_external3/

#folder 6
mv external/a* external/b* external/c* external/d* external/e* external/f* external/g* external/h* external/i* external/j* external/k* external/M* $RESULT/6/ep820_40_external1/

#folder 7
mv packages/apps/A* packages/apps/B* packages/apps/C* packages/apps/D* packages/apps/E* packages/apps/F* packages/apps/G* packages/apps/HT* packages/apps/HwA* packages/apps/HwB* packages/apps/HwC* packages/apps/HwD* packages/apps/HwE* packages/apps/HwF* packages/apps/HwG* packages/apps/HwI* $RESULT/7/ep820_40_packetsapps1/
mv packages/apps/HwK* packages/apps/HwL* packages/apps/HwM* packages/apps/HwN* packages/apps/HwO* packages/apps/HwP* packages/apps/HwQ* packages/apps/HwR* packages/apps/HwK*packages/apps/HwS* packages/apps/HwT* packages/apps/HwV* packages/apps/HwW* packages/apps/I* packages/apps/K* packages/apps/L* packages/apps/M* packages/apps/N* packages/apps/O* packages/apps/P* packages/apps/Q* packages/apps/R* packages/apps/S* packages/apps/T* packages/apps/U* packages/apps/V*  $RESULT/7/ep820_40_packetsapps2/

#folder 8
mv prebuilts/ndk/4 prebuilts/ndk/5 prebuilts/ndk/6 prebuilts/ndk/7 $RESULT/8/ep820_40_prebuiltsndk1/
mv prebuilts/c* prebuilts/d*  prebuilts/e*  prebuilts/g*  prebuilts/m*  prebuilts/p*  prebuilts/q*  prebuilts/r*  prebuilts/s*  prebuilts/t*  $RESULT/8/ep820_40_prebuiltsother3/

#folder 9
mv prebuilts/ndk/8 $RESULT/9/ep820_40_prebuiltsndk2/
mv prebuilts/ndk/9 $RESULT/9/ep820_40_prebuiltsndk3/

#folder 10
mv vendor/huawei vendor/opensource vendor/tdtech vendor/thirdparty  $RESULT/10/ep820_40_vendor/
mv vendor/hisi/modem/system/external  $RESULT/10/ep820_40_vendor_external/
mv vendor/hisi/* $RESULT/10/ep820_40_vendor_hisi/
mv $RESULT/10/ep820_40_vendor_hisi/modem $RESULT/10/ep820_40_vendor_modem/

#folder 11
mv CI Document k3-LLT $RESULT/11/
mv vendor/hisi/modem/system/vxworks/WindRiver/vxworks-6.8/target  $RESULT/11/ep820_40_vendor_vxworks1/

#folder 12
mv vendor/hisi/modem/system/vxworks/WindRiver/vxworks-6.8/* $RESULT/12/ep820_40_vendor_vxworks2/
rm -rf vendor/hisi/modem/system/vxworks/WindRiver/vxworks-6.8

#folder 13
mv vendor/hisi/modem/system/vxworks/WindRiver/* $RESULT/13/ep820_40_vendor_windriver2/

#folder 14
mv device frameworks $RESULT/14/ep820_40_devi_frame/
mv packages/* $RESULT/14/ep820_40_packets3/

echo "All done,please check result in $RESULT"
