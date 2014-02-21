require "WinManager"
w = Window.new()
w:Attach("CalcFrame")
w2 = w:FindWindow(0,"CalcFrame")
w3 = w2:FindWindow(0)
w4 = w2:FindWindow(w3.hwnd)
w5 = w2:FindWindow(w4.hwnd)--find the parent of number button
w5:FindControl(0x51):Click()--C
w5:FindControl(0x83):Click()--1
w5:FindControl(0x84):Click()--2
w5:FindControl(0x5d):Click()--+
w5:FindControl(0x85):Click()--3
w5:FindControl(0x86):Click()--4
w5:FindControl(0x79):Click()--=