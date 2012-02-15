.PHONY: all clean ironpython ironpython-rel ruby-rel

all: ironpython

ironpython:
	xbuild Solutions/IronPython.Mono.sln

ironpython-rel:
	xbuild /p:Configuration="Release" Solutions/IronPython.Mono.sln

ruby-rel:
	xbuild /p:Configuration="Release" Solutions/Ruby.sln

testrunner:
	xbuild Test/TestRunner/TestRunner.sln	

test-ipy: ironpython testrunner
	mono Test/TestRunner/TestRunner/bin/Debug/TestRunner.exe Test/IronPython.tests /all

clean:
	xbuild Solutions/IronPython.Mono.sln /t:Clean

