let s:colors = ["#9CD8F7", "#F5FA1D", "#F97C65", "#35D27F", "#EB75D6", "#E5D180", "#8997F5", "#D49DA5", "#7FEC35", "#F6B223", "#B4F1C3", "#99B730", "#F67C1B", "#3AC6BE", "#EAAFF1", "#DE9A4E", "#BBEA87", "#EEF06D", "#8FB272", "#EAA481", "#F58AAE", "#80B09B", "#5DE866", "#B5A5C5", "#88ADE6", "#4DAABD", "#EDD528", "#FA6BB2", "#47F2D4", "#F47F86", "#2ED8FF", "#B8E01C", "#C5A127", "#74BB46", "#D386F1", "#97DFD6", "#B1A96F", "#66BB75", "#97AA49", "#EF874A", "#48EDF0", "#C0AE50", "#89AAB6", "#D7D1EB", "#5EB894", "#57F0AC", "#B5AF1B", "#B7A5F0", "#8BE289", "#D38AC6", "#C8EE63", "#ED9C36", "#85BA5F", "#9DEA74", "#85C52D", "#40B7E5", "#EEA3C2", "#7CE9B6", "#8CEC58", "#D8A66C", "#51C03B", "#C4CE64", "#45E648", "#4DC15E", "#63A5F3", "#EA8C66", "#D2D43E", "#E5BCE8", "#E4B7CB", "#B092F4", "#44C58C", "#D1E998", "#76E4F2", "#E19392", "#A8E5A4", "#BF9FD6", "#E8C25B", "#58F596", "#6BAEAC", "#94C291", "#7EF1DB", "#E8D65C", "#A7EA38", "#D38AE0", "#ECF453", "#5CD8B8", "#B6BF6B", "#BEE1F1", "#B1D43E", "#EBE77B", "#84A5CD", "#CFEF7A", "#A3C557", "#E4BB34", "#ECB151", "#BDC9F2", "#5EB0E9", "#E09764", "#9BE3C8", "#B3ADDC", "#B2AC36", "#C8CD4F", "#C797AF", "#DCDB26", "#BCA85E", "#E495A5", "#F37DB8", "#70C0B1", "#5AED7D", "#E49482", "#8AA1F0", "#B3EDEE", "#DAEE34", "#EBD646", "#ECA2D2", "#A0A7E6", "#3EBFD3", "#C098BF", "#F1882E", "#77BFDF", "#7FBFC7", "#D4951F", "#A5C0D0", "#B892DE", "#F8CB31", "#75D0D9", "#A6A0B4", "#EA98E4", "#F38BE6", "#DC83A4"]

if (exists('g:semanticGUIColors'))
	let s:colors = g:semanticGUIColors
endif

function! semhl#config#colors()
  return s:colors
endfunction

let s:blacklist = {
\ 'javascript': {
  \ 'Component': 1,
  \ 'render': 1,
  \ 'constructor': 1,
  \ 'console': 1,
  \ 'log': 1,
  \ 'await': 1,
  \ 'window': 1,
  \ 'break': 1,
  \ 'case': 1,
  \ 'catch': 1,
  \ 'class': 1,
  \ 'const': 1,
  \ 'continue': 1,
  \ 'debugger': 1,
  \ 'default': 1,
  \ 'delete': 1,
  \ 'do': 1,
  \ 'else': 1,
  \ 'enum': 1,
  \ 'export': 1,
  \ 'extends': 1,
  \ 'false': 1,
  \ 'finally': 1,
  \ 'for': 1,
  \ 'function': 1,
  \ 'if': 1,
  \ 'implements': 1,
  \ 'import': 1,
  \ 'in': 1,
  \ 'instanceof': 1,
  \ 'interface': 1,
  \ 'let': 1,
  \ 'new': 1,
  \ 'null': 1,
  \ 'package': 1,
  \ 'private': 1,
  \ 'protected': 1,
  \ 'public': 1,
  \ 'return': 1,
  \ 'static': 1,
  \ 'super': 1,
  \ 'switch': 1,
  \ 'this': 1,
  \ 'throw': 1,
  \ 'true': 1,
  \ 'try': 1,
  \ 'typeof': 1,
  \ 'require': 1,
  \ 'from': 1,
  \ 'props': 1,
  \ 'state': 1,
  \ 'bind': 1,
  \ 'var': 1,
  \ 'void': 1,
  \ 'while': 1,
  \ 'with': 1,
  \ }
\ }
function! semhl#config#blacklist()
	return s:blacklist
endfunction
