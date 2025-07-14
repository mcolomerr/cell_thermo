
//GUI dialog
Dialog.create("Autoclick for Manual Tracking")
Dialog.addMessage("CAUTION:  "+"\n"+"Clicks will be performed anywhere on the screen "+"\n"+"where the mouse points. Press ESC to abort.");
Dialog.addMessage("There are "+nSlices+" slices in the images stack \""+getTitle+"\".");
Dialog.addMessage("Automatic clicking will start specified time after pressing OK/ENTER."); 
Dialog.addMessage("BE READY!!!")
Dialog.addNumber("Wait before start in [s]", 1)
Dialog.addNumber("Number of clicks", nSlices)
Dialog.addNumber("Click interval in [ms]", 500)
Dialog.show()

waittime=Dialog.getNumber(); //time in seconds to wait before clicking starts
clicks=Dialog.getNumber();	//number of clicks to perform
interval=Dialog.getNumber();	//time in milliseconds between each click

//Countdown
title = "[Countdown]";
run("Text Window...", "name="+ title +" width=50 height=2 monospaced");
step=0.1;
for (i=waittime; i>=0; i=i-step) {
	showStatus(i+"s to wait");
	showProgress(i/waittime);	//decreasing
	print(title, "\\Update:"+i+" s before clicking starts");
	wait(1000*step);
    }
print(title, "\\Close");

//actual clicking
for (i=0; i<clicks; i++) {
	wait(interval);
	run("IJ Robot", "order=KeyPress delay=20");
    }