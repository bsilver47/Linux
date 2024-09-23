#!/bin/bash
# modify this line to correct the filename and uncomment all radio names you want setup
bash radioconda-*-Linux-x86_64.sh -h
conda activate base || /home/usr/Downloads/radioconda/bin/activate
# rtlsdr=true
# iio=true
# plutosdr=true
# airspy=true
# hackrf=true
# bladerf=true
# limesdr=true
# uhd=true
# mirisdr=true

if [ "$rtlsdr" = true ] ; then
    sudo ln -s $CONDA_PREFIX/etc/modprobe.d/rtl-sdr-blacklist.conf /etc/modprobe.d/radioconda-rtl-sdr-blacklist.conf
    sudo modprobe -r $(cat $CONDA_PREFIX/etc/modprobe.d/rtl-sdr-blacklist.conf | sed -n -e 's/^blacklist //p')
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/rtl-sdr.rules /etc/udev/rules.d/radioconda-rtl-sdr.rules
    sudo udevadm control --reload
    sudo udevadm trigger
fi
if [ "$iio" = true ] | [ "$plutosdr" = true ] ; then
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/90-libiio.rules /etc/udev/rules.d/90-radioconda-libiio.rules
    sudo udevadm control --reload
    sudo udevadm trigger
fi
if [ "$airspy" = true ] ; then
    # run the next line only for the Airspy R2 or Mini
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/52-airspy.rules /etc/udev/rules.d/52-radioconda-airspy.rules
    # run the next line only for the Airspy HF+
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/52-airspyhf.rules /etc/udev/rules.d/52-radioconda-airspyhf.rules
    sudo udevadm control --reload
    sudo udevadm trigger
    sudo usermod -a -G plugdev $USER
fi
if [ "$hackrf" = true ] ; then
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/53-hackrf.rules /etc/udev/rules.d/53-radioconda-hackrf.rules
    sudo udevadm control --reload
    sudo udevadm trigger
    sudo usermod -a -G plugdev $USER
fi
if [ "$bladerf" = true ] ; then
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/88-nuand-bladerf1.rules /etc/udev/rules.d/88-radioconda-nuand-bladerf1.rules
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/88-nuand-bladerf2.rules /etc/udev/rules.d/88-radioconda-nuand-bladerf2.rules
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/88-nuand-bootloader.rules /etc/udev/rules.d/88-radioconda-nuand-bootloader.rules
    sudo udevadm control --reload
    sudo udevadm trigger
    sudo usermod -a -G plugdev $USER
fi
if [ "$limesdr" = true ] ; then
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/64-limesuite.rules /etc/udev/rules.d/64-radioconda-limesuite.rules
    sudo udevadm control --reload
    sudo udevadm trigger
fi
if [ "$uhd" = true ] ; then
    uhd_images_downloader
    sudo ln -s $CONDA_PREFIX/lib/uhd/utils/uhd-usrp.rules /etc/udev/rules.d/radioconda-uhd-usrp.rules
    sudo udevadm control --reload
    sudo udevadm trigger
fi
if [ "$mirisdr" = true ] ; then
    sudo ln -s $CONDA_PREFIX/lib/udev/rules.d/mirisdr.rules /etc/udev/rules.d/radioconda-mirisdr.rules
    sudo udevadm control --reload
    sudo udevadm trigger
fi
