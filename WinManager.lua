require "winapi"
require "Class"

local WM_LBUTTONDOWN = 0x0201
local WM_LBUTTONPU = 0x0202
local BM_SETCHECK = 0x00F1

Window=class()

function Window:ctor(hwnd)
	print("Window ctor " .. tostring(hwnd))
	self.hwnd = hwnd
end
 
function Window:Attach(className,winName)
	self.hwnd = FindWindow(className,winName)
	print("Window Attach " .. tostring(self.hwnd))
	return self:IsWindow()
end

function Window:IsWindow()
	return self.hwnd ~= nil and self.hwnd ~= 0
end

function Window:FindControl(id)
	print("FindControl " .. tostring(self.hwnd) .. " " .. tostring(id))
	if self:IsWindow() then
		ch = GetDlgItem(self.hwnd,id)
		c = WControl.new(ch)
		print("FindControl result " .. tostring(ch) )
		return c
	end
end

function Window:FindWindow(afterhWnd,className,winName)
	if self:IsWindow() then
		ch = FindWindowEx(self.hwnd,afterhWnd,className,winName)
		c = WControl.new(ch)
		print("FindWindow result " .. tostring(ch) )
		return c
	end
end

function Window:Show(s)
	ShowWindow(self.hwnd,s);
end

WControl = class(Window)

function WControl:Click()
	SendMessage(self.hwnd,WM_LBUTTONDOWN,0,0);
	Sleep(20);
	SendMessage(self.hwnd,WM_LBUTTONPU,0,0);
end

function WControl:SetCheck(c)
	if c then check = 1 else check = 0 end
	SendMessage(self.hwnd,BM_SETCHECK,check,0);
end

function WControl:SetText(t)
	EditSetText(self.hwnd,t);
end