local db = require('dashboard')

db.session_directory = vim.fn.stdpath('cache')..'/persistent_session'
db.custom_header = {
   "            :h-                                  Nhy`               ",
   "           -mh.                           h.    `Ndho               ",
   "           hmh+                          oNm.   oNdhh               ",
   "          `Nmhd`                        /NNmd  /NNhhd               ",
   "          -NNhhy                      `hMNmmm`+NNdhhh               ",
   "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
   "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
   "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
   "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
   " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
   " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
   " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
   " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
   "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
   "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
   "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
   "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
   "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
   "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
   "       //+++//++++++////+++///::--                 .::::-------::   ",
   "       :/++++///////////++++//////.                -:/:----::../-   ",
   "       -/++++//++///+//////////////               .::::---:::-.+`   ",
   "       `////////////////////////////:.            --::-----...-/    ",
   "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
   "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
   "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
   "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
   "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
   "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
   "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
   "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
   "                        .-:mNdhh:.......--::::-`                    ",
   "                           yNh/..------..`                          ",
   "                                                                    ",
}

db.custom_center = {
  {
    icon = ' ',
    desc = 'Find File             ',
    shortcut = 'SPC f f',
    action = 'Telescope find_files'
  },
  {
    icon = '',
    desc = ' Reccents              ',
    shortcut = 'SPC f o',
    action = 'Telescope oldfiles'
  },
  {
    icon = '',
    desc = ' Find Word             ',
    shortcut = 'SPC f w',
    action = 'Telescope live_grep'
  },
  {
    icon = '洛',
    desc = 'New File              ',
    shortcut = 'SPC f n',
    action = 'DashboardNewFile'
  },
  {
    icon = '',
    desc = ' Bookmarks             ',
    shortcut = 'SPC b m',
    action = 'Telescope marks'
  },
  {
    icon = '',
    desc = ' Load Last Session     ',
    shortcut = 'SPC l  ',
    action = 'SessionLoad'
  },
}
