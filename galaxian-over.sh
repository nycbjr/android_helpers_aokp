!~#/bin/sh

## first create a place to dump duplicate/backed up tree/vendor/scripts files ##
mkdir aokp-moved
mkdir aokp-moved/vendor
mkdir aokp-moved/vendor/samsung
mkdir aokp-moved/vendor/aokp
mkdir aokp-moved/vendor/aokp/products
mkdir aokp-moved/device
mkdir aokp-moved/device/samsung

## Create a place to pull changes scripts/files/etcm, note these may need to be hand edited ##

## Overlay galaxian-soup git files to allow build ##

## Grab GT-7310/7300 Proprietary Vendor FIles ##
git clone git://github.com/Galaxian-Soup/android_vendor_samsung_p5wifi.git vendor/samsung/p5wifi
git clone git://github.com/Galaxian-Soup/android_vendor_samsung_p5.git vendor/samsung/p5

## Grab P5 device tree ##
mv device/samsung/p5-common aokp-moved/device/samsung 
mv device/samsung/p5wifi aokp-moved/device/samsung 
mv device/samsung/p5 aokp-moved/device/samsung 
git clone git://github.com/Galaxian-Soup/p5wifi_android_ics_device_tree.git device/samsung/p5wifi
git clone git://github.com/Galaxian-Soup/p5_android_ics_device_tree.git device/samsung/p5
git clone git://github.com/Galaxian-Soup/p5-common_android_ics_device_tree.git device/samsung/p5-common

## Fixes to allow aokp style builds ##
## Now lets add the p5. p5wifi build stuff to aokp vendor
cp vendor/aokp/vendorsetup.sh aokp-moved/vendor/aokp/
echo "add_lunch_combo aokp_p5-userdebug" >> vendor/aokp/vendorsetup.sh
mv vendor/aokp/products/p5wifi.mk aokp-moved/vendor/aokp/products
cp vendor/aokp/products/AndroidProducts.mk aokp-moved/vendor/aokp/products
cp /lindata/repos/aokp-mod/AndroidProducts.mk vendor/aokp/products
cp /lindata/repos/aokp-mod/p5wifi.mk vendor/aokp/products
cp /lindata/repos/aokp-mod/p5.mk vendor/aokp/products

## Copy p5 overlay from cloned device tree to vendor/aokp/overlay ##
cp -R device/samsung/p5wifi/overlay/* vendor/aokp/overlay/p5wifi
cp -R device/samsung/p5/overlay/* vendor/aokp/overlay/p5

## Copy RomControl into overlay
cp -R vendor/aokp/overlay/p4-common/packages/* vendor/aokp/overlay/p5wifi
cp -R vendor/aokp/overlay/p4-common/packages/* vendor/aokp/overlay/p5


