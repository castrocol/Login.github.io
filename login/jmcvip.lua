gg.alert('🎅🏻Script JMC-VIP🎅🏻\n🎁Lean Atentamente La siguiente Información🎁\n🌠Terminos y Condiciones🌠\n☃️Recomendaciones Para Ocultar el root☃️\n🎄Forma Correcta de Activar Los Poderes🎄','(✅) 4️⃣')
gg.alert('🌠Terminos y Condiciones🌠\n Ustedes deben ser consientes que toda acción tiene una consecuencia, al usar este producto su cuenta puede ser suspendida permanente, YO NO ME AGO RESPONSABLE POR ESO','(✅) 3️⃣')
gg.alert('☃️Recomendaciones Para Ocultar el root☃️\nUsar magisk kitsune, en agustes de magisk ocultan el magisk, y activan todas las opciones para ocultar el root que trae  \ntambién como minimo debe pasar 2 integridades de la Google play , pueden usar módulos como, play integrity, playcurl, triky store ','(✅) 2️⃣')
gg.alert('🎄Forma Correcta de Activar Los Poderes🎄\nLos Poderes Se Activan En Prelogin\nAntes De Entrar A La Cuenta\n Para eso cada vez que termine de jugar siere sesión en el juego\n Despues de acrivar lo que vas a usar sierra la script\nsi activas las opciones y juegas en una cuenta y quieres cambiar de cuenta debes serar el juego y aser todo el proseso de nuevo\n no dejen el juego en segundo plano si usan las opciones de cuenta segundaría\n','(✅) 1️⃣')
gg.alert('🎅🏻SI SE TE OLVIDÓ SERRAR SESIÓN NO EJECUTE LA SCRIPT, SIERRA SESIÓN Y EMPIEZA EL PROSESO DE NUEVO 🎅🏻\nSI ES TU PRIMERA VEZ USANDO ESTA SCRIP PRUEBA 10 PARTIDAS EN UNA CUENTA BOOT PARA VER SI EL JUEGO TE DETECTA ALGO O VER SI TIENES VIEN OCULTO EL ROOT, SI NO PASA NADA SIERRAS SESIÓN, SIERRAS EL JUEGO Y ASES TODO EL PROSESO DE NUEVO CON LA CUENTA QUE DESEAS JUGAR\nSI TE DA POR USAR LAS OPCIONES DE CUENTA SEGUNDARÍA EN UNA CUENTA PRINCIPAL  SIEMPRE ANTES DE JUGAR PRUEBA JUGANDO 5 PARTIDAS EN UNA CUENTA SEGUNDARÍA, SIERRAS SESIÓN, SIERRAS EL JUEGO Y ASES TODO EL PROSESO DE NUEVO CON LA CUNTAS QUE DESEES JUGAR','(✅)')
--[[gg.setVisible(false)
-- Ocultar GG
gg.setConfig(2131427463, 2|4)
-- Bypass
gg.setConfig(2131427464, 1)
local keys = {"@castrocol"} -- write all your choosen passwords in this tab .
local main = gg.prompt({"Ponga La Contraseña 😀 :"},nil,{"text"})
if not main then return end
for l , I in pairs(keys) do
if main[1] == I then A = true end
end
if A ~= true then gg.alert(" CONTRASEÑA INCORRECTA 🤡 ") return else gg.toast("CONTRASEÑA CORRECTA 😈") end]]--
--liboffset
--[[function JMC(Lib,Offset, EditHex)
local jmc = gg
local t = jmc.getRangesList(Lib)
if #t == 0 then 
return os.exit()
else 
for Lua, Lol in pairs(t) do 
local t = gg.getValues({{address = Lol.start, flags = 4}, {address = Lol.start + 0x12, flags = gg.TYPE_WORD}})
if t[1].value == 0x464C457F then 
Offset = Lol["start"] + Offset 
end 
Code = {}
if type(EditHex) == "number" then 
Lua = "" 
for Lua = 1, EditHex do 
Code[Lua] = {address = (Offset - 1) + Lua, flags = gg.TYPE_BYTE} 
end
for v, Lol in ipairs(gg.getValues(Code)) do 
Lua = Lua .. string.format("%02X", Lol.value & 0xFF) 
end 
return Lua 
end
Byte = {} 
EditHex:gsub("..", function(x) 
Byte[#Byte + 1] = x Code[#Byte] = {address = (Offset - 1) + #Byte, flags = gg.TYPE_BYTE, value = x .. "h"}
end)
gg.setValues(Code)
end
end
end
gg.toast("Cargando ⏳")
function CheckProcess()
local Regions = gg.getRangesList()
local LastAddress = Regions[#Regions]["end"]
return (LastAddress >> 32) ~= 0
end
function GetClassName(Letter)
local RegionsToSearch = {
[1] = gg.REGION_C_ALLOC,
[2] = gg.REGION_OTHER,
[3] = gg.REGION_ANONYMOUS
}
local ClassName = {}
for i, Ranges in ipairs(RegionsToSearch) do
gg.setRanges(Ranges)
gg.loadResults(Letter)
gg.searchPointer(0)
ClassName = gg.getResults(gg.getResultsCount())
gg.clearResults()
if #ClassName > 0 then
break
end
end
if #ClassName == 0 then
print("Sin Resultados Encontrados... Por Favor Activar Dentro Del Juego.")
os.exit()
end
return ClassName
end
local MyOffset = ""
local x64 = CheckProcess()
function SearchClassName(Text, Offset, Type)
gg.clearResults(true)
gg.clearList()
gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
local Metadata = gg.getRangesList("global-metadata.dat")
if Metadata == nil then
Region_Start = Metadata[1]["start"] and gg.TYPE_DWORD
Region_End = Metadata[1]["end"]
else
Region_Start = 0
Region_End = -1
end
gg.searchNumber(":" .. string.char(0) .. Text .. string.char(0), gg.TYPE_BYTE)
local Letters = gg.getResults(2)
local ClassFirstLetter = {Letters[2]}
gg.clearResults(true)
gg.loadResults(ClassFirstLetter)
gg.searchPointer(0)
local ClassNamePointer = GetClassName(ClassFirstLetter)
gg.setRanges(gg.REGION_ANONYMOUS)
local ClassInstant = {}
for i,v in ipairs(ClassNamePointer) do
local ClassPointer = {}
table.insert(ClassPointer, {
address = ClassNamePointer[i].address - (x64 and 0x10 or 0x8),
flags = gg.TYPE_DWORD
})
ClassPointer = gg.getValues(ClassPointer)
gg.clearResults()
gg.loadResults(ClassPointer) 
gg.searchPointer(0)
Resultss = gg.getResults(gg.getResultsCount())
if #Resultss >0 then
break
end
end
if #Resultss == 0 then
print("Sin Resultados Encontrados... Por Favor Activar Dentro Del Juego.")
os.exit()
end
MyOffset = MyOffset .. Offset
gg.addListItems(Resultss)
gg.clearResults()
local GetResultsFromSearch = {}
for j,instance in ipairs(Resultss) do
table.insert(GetResultsFromSearch, {
address = instance.address + MyOffset,
flags = Type,
})
end
GetResultsFromSearch = gg.getValues(GetResultsFromSearch)
gg.loadResults(GetResultsFromSearch)
gg.clearList()
end
if gg.getTargetPackage() == "com.dts.freefireth" then
SearchClassName("OOIPMACFIFL","0x134", gg.TYPE_DWORD)
Guest = "0x554E3AC"; Female = "0x4318E38"
FF = "FF-1.106"
elseif gg.getTargetPackage() == "com.dts.freefiremax" then 
SearchClassName("OOIPMACFIFL","0x14C", gg.TYPE_DWORD)
Guest = "0x5623104"; Female = "0x437C7B8"
FF = "FF-MAX-2.106"
else gg.alert("No se encuentran datos del juego, por favor ejecute el script después de abrir el juego.") 
os.exit() gg = nil 
end]]
local AllResults = gg.getResults(gg.getResultsCount())
local C1, C17, C30, C20, C7, C4, C5, C15, C6, C2, C8, C3, C50, C42, C100, C10, C35, C22, C80, C60, C18, C25, C9, C16 = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local Recoil = {}
for Number, Value in ipairs(AllResults) do
if Value.value == 1 or Value.value == 17 or Value.value == 30 or Value.value == 20 or Value.value == 7 or Value.value == 4 or Value.value == 5 or Value.value == 6 or Value.value == 2 or Value.value == 8 or Value.value == 3 or Value.value == 50 or Value.value == 42 or Value.value == 100 or Value.value == 10 or Value.value == 35 or Value.value == 22 or Value.value == 80 or Value.value == 60 or Value.value == 18 or Value.value == 25 then 
Valueee = gg.getValues({{address = Value.address+8, flags = gg.TYPE_FLOAT}})
for i, v in pairs(Valueee) do
Valueee2 = gg.getValues({{address = v.address+8, flags = gg.TYPE_FLOAT}})
for b, c in pairs(Valueee2) do
if v.value == c.value then
Recoil[#Recoil +1] = {address = Value.address+8, flags = gg.TYPE_FLOAT}
end;end;end;end
if Value.value == 1 then
C1[#C1+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 17 then
C17[#C17+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 30 then
C30[#C30+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 20 then
C20[#C20+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 7 then
C7[#C7+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 4 then
C4[#C4+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 5 then
C5[#C5+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 15 then
C15[#C15+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 6 then
C6[#C6+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 2 then
C2[#C2+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 8 then
C8[#C8+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 3 then
C3[#C3+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 50 then
C50[#C50+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 42 then
C42[#C42+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 100 then
C100[#C100+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 10 then
C10[#C10+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 35 then
C35[#C35+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 22 then
C22[#C22+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 80 then
C80[#C80+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 60 then
C60[#C60+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 18 then
C18[#C18+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 25 then
C25[#C25+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 9 then
C9[#C9+1] = {address = Value.address, flags = Value.flags}
end
if Value.value == 16 then
C16[#C16+1] = {address = Value.address, flags = Value.flags}
end
end
gg.clearResults(gg.getResultsCount())
gg.clearResults(nil)
gg.toast("Carga Completada ✔️")
gg.sleep(1000)
gg.setVisible(true)

function START()
gg.clearResults(gg.getResultsCount())
menu = gg.multiChoice({
"🔵 ACTIVA CON CONFIANZA",
"🔴 ACTIVA BAJO TU RIESGO", 
"⚫️ ACTIVA EN CUENTA DE INVITADO",
"✖ salir ✖"},nil,[[✪ JMC-VIP | FFx64bit v1.108 ✪]])
if menu == nil then else
if menu [1] ==true then menusafe() end
if menu [2] ==true then menurisk() end
if menu [3] ==true then menuboot() end
if menu [4] ==true then exit() end
end
XGCK= -1
end

function menusafe()
gg.alert('SI OCULTAS EL ROOT COMO YO RECOMIENDO TU CUENTA BA A ESTAR SEGURA')
menus = gg.multiChoice({
"📶 ANTENAS",
"🏥 CURAR RÁPIDO",
"🔥 REGEDITS",
"🔴 AYUDA APUNTADO",
"🐼 BLANCO & NEGRO",
"➖ SIN RETROCESO ",
"📥 MAS CARGADOR",
"◀ Atrás"},nil,"🔵 ACTIVA CON CONFIANZA")
if menus == nil then else
if menus [1] ==true then antenas() end
if menus [2] ==true then curar() end
if menus [3] ==true then reg() end
if menus [4] ==true then aim() end
if menus [5] ==true then blayne() end
if menus [6] ==true then rec() end
if menus [7] ==true then carga() end
if menus [8] ==true then START() end
end
XGCK= -1
end

function antenas()
menua = gg.multiChoice({
"📡 ANTENA CUERPO",
"📡 ANTENA FINA",
"📡 ANTENA HOMBRO",
"📡 ANTENA BRAZO",
"💡 LASER MONEDAS",
"◀ Atrás"},nil,"▶ ELIJE TU ANTENA FAVORITA:")
if menua == nil then else
if menua [1] ==true then antena() end
if menua [2] ==true then antenaf() end
if menua [3] ==true then antenah() end
if menua [4] ==true then antenab() end
if menua [5] ==true then item() end
if menua [6] ==true then menusafe() end
end
XGCK= -1
end

function antena()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("QDB0A72BE1CFC2FB500000000", 1)
gg.refineNumber("Q00000000", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("Q33F39543", 1)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("QF36D9BBE2B0562B500000000", 1)
gg.refineNumber("Q00000000", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("Q33F39543", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 📡")
end

function antenaf()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";賰㎙ 㾀", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";賰㎙䀀䖜", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";䃬㓓 㾀", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";䃬㓓䀀䖜", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 📡")
end

function antenah()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";㾆뼼 㾀", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";㾆뼼 䎖", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";폓뽄 㾀", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";폓뽄 䎖", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 📡")
end

function antenab()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";Ꮊ뼐 㾀", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";Ꮊ뼐 䎖", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.searchNumber(";豫뼆 㾀", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll(";豫뼆 䎖", gg.TYPE_WORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 📡")
end

function item()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("h 69 00 6E 00 67 00 61 00 6D 00 65 00 2F 00 70 00 69 00 63 00 6B 00 75 00 70 00 2F 00 63 00 61 00 6E 00 64 00 79 00 2F 00 6F 00 62 00 33 00 31 00 2F 00 69 00 6E 00 67 00 61 00 6D 00 65 00 74 00 6F 00 6B 00 65 00 6E 00", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount()) --ingame/pickup/candy/ob31/ingametoken
gg.editAll("h 65 00 66 00 66 00 65 00 63 00 74 00 73 00 2F 00 76 00 66 00 78 00 5F 00 69 00 6E 00 67 00 61 00 6D 00 65 00 5F 00 6C 00 61 00 73 00 65 00 72 00", gg.TYPE_BYTE)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 💡")
end

function curar()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(";K  䂠 䂀", gg.TYPE_WORD)
gg.refineNumber("; 䂀", gg.TYPE_WORD)
gg.getResults(gg.getResultsCount())
gg.editAll("; 䁀", gg.TYPE_WORD)
gg.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("25D;2;25D::13", 16)
gg.refineNumber("2", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("1", 16)
gg.clearResults(true)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3;0.56699997187", 16)
gg.refineNumber("3", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.95000004768", 16)
gg.clearResults(true)
gg.toast("ACTIVADO 🏥")
end

function reg()
menureg = gg.choice({
"🔥 REGEDIT VERSIÓN #1",
"🔥 REGEDIT VERSIÓN #2",
"🔥 REGEDIT VERSIÓN #3",
"🔥 REGEDIT VERSIÓN #4",
"◀ Atrás"},nil,"▶ ELIJE TU REGEDIT FAVORITO:")
if menureg == 1 then v1() end
if menureg == 2 then v2() end
if menureg == 3 then v3() end
if menureg == 4 then v4() end
if menureg == 5 then menusafe() end
XGCK= -1
end

function v1()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("20;40;35;45", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 🔥")
end

function v2()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("30;50;40;60", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 🔥")
end

function v3()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("25;45;60;80", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 🔥")
end

function v4()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("15.0;35.0;10.0;20.0::13", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("20;40;55;50", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 🔥")
end

function aim()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("3FACCCCD3FACCCCDh", gg.TYPE_QWORD)
gg.getResults(gg.getResultsCount())
gg.editAll("3FACCCCD42B3CCCDh", gg.TYPE_QWORD)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 🔴")
end

function blayne()
gg.setRanges(gg.REGION_VIDEO)
gg.searchNumber("1072216622", 4)
gg.getResults(gg.getResultsCount())
gg.editAll("1147786543", 4)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("h 00 00 70 40 00 00 00 3F", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("h 00 00 70 40 66 66 48 42", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 🐼")
end

function rec()
gg.loadResults(Recoil)
gg.getResults(gg.getResultsCount())
gg.editAll("2", gg.TYPE_FLOAT) 
gg.clearResults(true)
gg.toast("ACTIVADO ➖")
end

function carga()
gg.loadResults(C1)
gg.getResults(gg.getResultsCount())
gg.editAll("2", gg.TYPE_DWORD) -- 1 | M590
gg.clearResults(false);
gg.loadResults(C17)
gg.getResults(gg.getResultsCount())
gg.editAll("27", gg.TYPE_DWORD) -- 17 | USP, USP-2
gg.clearResults(false);
gg.loadResults(C30)
gg.getResults(gg.getResultsCount())
gg.editAll("50", gg.TYPE_DWORD) -- 30
gg.clearResults(true)
gg.loadResults(C20)
gg.getResults(gg.getResultsCount())
gg.editAll("40", gg.TYPE_DWORD) -- 20
gg.clearResults(true)
gg.loadResults(C7)
gg.getResults(gg.getResultsCount())
gg.editAll("10", gg.TYPE_DWORD) -- 7
gg.clearResults(true)
gg.loadResults(C4)
gg.getResults(gg.getResultsCount())
gg.editAll("8", gg.TYPE_DWORD) -- 4
gg.clearResults(true)
gg.loadResults(C5)
gg.getResults(gg.getResultsCount())
gg.editAll("10", gg.TYPE_DWORD) -- 5
gg.clearResults(true)
gg.loadResults(C15)
gg.getResults(gg.getResultsCount())
gg.editAll("30", gg.TYPE_DWORD) -- 15
gg.clearResults(true)
gg.loadResults(C6)
gg.getResults(gg.getResultsCount())
gg.editAll("12", gg.TYPE_DWORD) -- 6
gg.clearResults(true)
gg.loadResults(C2)
gg.getResults(gg.getResultsCount())
gg.editAll("4", gg.TYPE_DWORD) -- 2
gg.clearResults(true)
gg.loadResults(C8)
gg.getResults(gg.getResultsCount())
gg.editAll("16", gg.TYPE_DWORD) -- 8
gg.clearResults(true)
gg.loadResults(C3)
gg.getResults(gg.getResultsCount())
gg.editAll("6", gg.TYPE_DWORD) -- 3
gg.clearResults(true)
gg.loadResults(C50)
gg.getResults(gg.getResultsCount())
gg.editAll("80", gg.TYPE_DWORD) -- 50
gg.clearResults(true)
gg.loadResults(C42)
gg.getResults(gg.getResultsCount())
gg.editAll("62", gg.TYPE_DWORD) -- 42
gg.clearResults(true)
gg.loadResults(C100)
gg.getResults(gg.getResultsCount())
gg.editAll("120", gg.TYPE_DWORD) -- 100
gg.clearResults(true)
gg.loadResults(C10)
gg.getResults(gg.getResultsCount())
gg.editAll("20", gg.TYPE_DWORD) -- 10
gg.clearResults(true)
gg.loadResults(C35)
gg.getResults(gg.getResultsCount())
gg.editAll("55", gg.TYPE_DWORD) -- 35
gg.clearResults(true)
gg.loadResults(C22)
gg.getResults(gg.getResultsCount())
gg.editAll("42", gg.TYPE_DWORD) -- 22
gg.clearResults(true)
gg.loadResults(C80)
gg.getResults(gg.getResultsCount())
gg.editAll("100", gg.TYPE_DWORD) -- 80
gg.clearResults(true)
gg.loadResults(C60)
gg.getResults(gg.getResultsCount())
gg.editAll("80", gg.TYPE_DWORD) -- 60
gg.clearResults(true)
gg.loadResults(C18)
gg.getResults(gg.getResultsCount())
gg.editAll("28", gg.TYPE_DWORD) -- 18
gg.clearResults(true)
gg.loadResults(C25)
gg.getResults(gg.getResultsCount())
gg.editAll("45", gg.TYPE_DWORD) -- 25
gg.clearResults(true)
gg.loadResults(C9)
gg.getResults(gg.getResultsCount())
gg.editAll("19", gg.TYPE_DWORD) -- 9
gg.clearResults(true)
gg.loadResults(C16)
gg.getResults(gg.getResultsCount())
gg.editAll("26", gg.TYPE_DWORD) -- 16
gg.clearResults(true)
gg.toast("ACTIVADO 📥")
end

function menurisk()
gg.alert('DEPENDIENDO DEL DISPOSITIVO ALGUNAS OPCIONES PUEDEN DAR BLACKLIS \nTESTEA EN UNA CUENTA BOOT CUALES OPCIONES TE DAN BLACKLIS Y NO LAS USES\nLA PRIMERA VEZ TIENES QUE JUGAR MINIMO 10 PARTIDAS, SERRAR SESIÓN, SERAR EL JUEGO Y BOLVER ASER TODO EL PROSESO DE NUEVO Y JUGAR OTRAS 10 PARTIDAS PARA SABER SI ESA OPCION TE DA BLACK LIS O NO\n DIARIAMENTE TESTEA LAS OPCIONES QUE NO TE DIERON BLACK LIS PARA SABER SI SIGUEN SIEDNO SEGURAS 5 PARTIDAS SERRAR SESIÓN, SERAR EL JUEGO Y BOLVER ASER TODO EL PROSESO DE NUEVO Y JUGAR OTRAS 2 PARTIDAS, PARA SABER SI LA OPCIÓN SIGUE SIENDO SEGURA')
menur = gg.multiChoice({
"🏪 MODO TIENDAS",
"🎁 MODO AIRDROPS",
"🔲 ATRAVESAR GLOO",
"🚀 CORRER RÁPIDO",
"💠 AYUDA MIRA",
"👽 CABEZOTAS",
"✨ BALAS MÁGICAS LITE",
"💯 HEADSHOT",
"🔺 ASISTENCIA AWM",
"🔄 CAMBIO RÁPIDO AWM",
"🚮 BORRAR INVITADO",
"◀ Atrás"},nil,"🔴 ACTIVA BAJO TU RIESGO")
if menur == nil then else
if menur [1] == true then tienda() end
if menur [2] == true then airdrop() end
if menur [3] == true then gloo() end
if menur [4] == true then correr() end
if menur [5] == true then aimm() end
if menur [6] == true then cbz() end
if menur [7] == true then bmh1() end
if menur [8] == true then hsmeta() end
if menur [9] == true then awm() end
if menur [10] == true then cambio() end
if menur [11] == true then inv() end
if menur [12] == true then START() end
end
XGCK= -1
end

function tienda()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "(" 00 00 "ingame/interactionobject/modelingameshop"')
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"',1)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 🏪")
end

function airdrop()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "!" 00 00 "ingame/pickup/item/pickup_airdrop" 00 00 00', 1) -- 1
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q "%" 00 00 "ingame/pickup/item/pickup_carepackage" 00 00 00', 1) -- 2
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q "#" 00 00 "ingame/levelobject/levellockairdrop" 00 00 00', 1) -- 3
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/levelobject/techairdrop" 00 00 00 00 00 00 00 00 00 00', 1) -- 4
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "ingame/sceneedit/sceneeditgroupbox"', 1)
gg.clearResults()
gg.toast("ACTIVADO 🎁")
end

function gloo()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('Q "#" 00 00 "ingame/assistantitem/icewall_bunker" 00 00 00', gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 22 00 00 00 "effects/vfx_pet/vfx_petskill_robot"', gg.TYPE_BYTE)
gg.clearResults()
gg.toast("ACTIVADO 🔲")
end

function correr()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("2.80259693e-44F;1.20000004768F;0.18000000715F;1.40129846e-45F", 16)
gg.refineNumber("1.20000004768", 16)
gg.getResults(gg.getResultsCount())
gg.editAll("2.2", 16)
gg.clearResults(gg.getResultsCount())
gg.toast("ACTIVADO 🚀")
end

function aimm()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("1075000115;1075000115::489", gg.TYPE_DWORD)
gg.getResults(gg.getResultsCount())
gg.editAll("-15", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("ACTIVADO 💠")
end

function cbz()
gg.setRanges(32)
gg.searchNumber("h 62 00 6F 00 6E 00 65 00 5F 00 4C 00 65 00 66 00 74 00 5F 00 57 00 65 00 61 00 70 00 6F 00 6E 00", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 62 00 6F 00 6E 00 65 00 5F 00 4E 00 65 00 63 00 6B 00", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 23 AA A6 B8 46 0A CD 70", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 23 AA A6 B8 B2 F7 1F A4", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 57 27 13 BE C5 26 27 BC 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 00 00 80 3F 00 00 80 3F 00 00 80 3F", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h EC 51 B8 BD 3B 64 29 BD 1F 02 81 B3 D6 2D 8B 29 73 4E D6 34 CB 5F 13 BE BA 55 7D 3F 72 1C C7 3F 72 1C C7 3F 72 1C C7 3F", gg.TYPE_BYTE)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 7B D5 FE BD 6B F1 AE BC DA 65 8F B3 38 C2 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 01 00 80 3F 01 00 80 3F 00 00 80 3F", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h EC 51 B8 BD 3B 64 29 BD DA 65 8F B3 38 C2 15 2A 1F CD 04 35 42 A6 36 BE 0D E5 7B 3F 00 00 C0 3F 00 00 C0 3F 00 00 C0 3F", gg.TYPE_BYTE)
gg.clearResults()
gg.toast("ACTIVADO 👽")
end

function bmh1()
gg.setRanges(32)
gg.searchNumber('Q 2C 00 00 00 "ingame/backweapon/backwp_bulletproofumbrella" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_eagle" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_g18" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_usp45" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1E 00 00 00 "ingame/backweapon/backwp_m1917" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_uzi" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_wsp" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1D 00 00 00 "ingame/backweapon/backwp_m500" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1C 00 00 00 "ingame/backweapon/backwp_pan" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1F 00 00 00 "ingame/backweapon/backwp_katana" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 20 00 00 00 "ingame/backweapon/backwp_machete" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "!" 00 00 "ingame/backweapon/backwp_crossbow" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "$" 00 00 "ingame/backweapon/backwp_baseballbat" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q "&" 00 00 "ingame/backweapon/backwp_superheat_gun" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.searchNumber('Q 1F 00 00 00 "ingame/backweapon/backwp_sickle" 00 00', 1)
gg.getResults(gg.getResultsCount())
gg.editAll('Q 15 00 00 00 "ingame/uav/uavpackage" 00 00', 1)
gg.clearResults()
gg.toast("ACTIVADO ✨")
end

function hsmeta()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber(":bone_Neck", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll(":bone_Necs", gg.TYPE_BYTE)
gg.clearResults(true)
gg.searchNumber(":bone_Hips", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll(":bone_Neck", gg.TYPE_BYTE)
gg.clearResults(true)
JMC("libil2cpp.so", Female, "C0035FD6")
gg.toast("ACTIVADO 💯")
end

function awm()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("h 8C 3F 8F C2 F5 3C CD CC CC 3D 06 00 00 00 00 00 00 00 00 00 00 00 00 00 F0 41 00 00 48 42 00 00 00 3F 33 33 13 40 00 00 B0 3F 00 00 80 3F 01", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 8C 3F 8F C2 F5 3C CD CC CC 3D 06 00 00 00 00 00 FF FF 00 00 00 00 00 00 F0 41 00 00 48 42 00 00 00 3F 33 33 13 40 00 00 B0 3F 00 00 80 3F 01", gg.TYPE_BYTE)
gg.clearResults(true)
gg.toast("ACTIVADO 🔺")
end

function cambio()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("h 00 00 00 00 3F 00 00 80 3E", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 00 EC 51 B8 3D 8F C2 F5 3C", gg.TYPE_BYTE)
gg.clearResults(true)
gg.toast("ACTIVADO 🔄")
end

function inv()
JMC("libil2cpp.so", Guest, "E0030032C0035FD6")
gg.toast("ELIMINADA 🚮")
end

function menuboot()
menub = gg.multiChoice({
"📶 ANTENAS",
"◀ Atrás"},nil,"⚫️ ACTIVA PARA TEST")
if menub == nil then else
if menub [1] ==true then xxx() end
if menub [2] ==true then START() end
end
XGCK= -1
end

function xxx()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("h 00 00 00 00 3F 00 00 80 3E", gg.TYPE_BYTE)
gg.getResults(gg.getResultsCount())
gg.editAll("h 00 EC 51 B8 3D 8F C2 F5 3C", gg.TYPE_BYTE)
gg.clearResults(true)
gg.toast("ACTIVADO 🔄")
end


function exit()
gg.toast("Gracias por apoyar 🤑")
print("░░░░░░░░░░░░░░")
print("░░░SCRIPT░VIP░░░")
print("░░░░BY░JMC.░░░░")
print("░░░░░░░░░░░░░░")
os.exit()
end

while true do if gg.isVisible(true) then XGCK = 1 gg.setVisible(false) end if XGCK == 1 then START() end end