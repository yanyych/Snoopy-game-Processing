PFont myFont;


import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer collisionLogSound;
AudioPlayer collisionSnowballSound;
AudioPlayer jumpSound;
AudioPlayer ctrlSound;
AudioPlayer clickSound; 
AudioPlayer mainSound; 


boolean isGameOver; // Флаг окончания игры


PImage backgroundImg;
PImage name;
PImage playImg, playHoverImg;
PImage settingsImg, settingsHoverImg;
PImage rulesImg, rulesHoverImg;
PImage soundImg, soundHoverImg;
PImage musicImg, musicHoverImg;
PImage noSoundImg, noSoundHoverImg;
PImage noMusicImg, noMusicHoverImg;
boolean isSoundOn = true; // Флаг для состояния звука
boolean isMusicOn = true; // Флаг для состояния музыки
PImage rulesPageImg; 
PImage characterPageImg; 
PImage backButtonImg, backButtonHoverImg;
PImage skiButtonImg, skiButtonHoverImg;
PImage boardButtonImg, boardButtonHoverImg;
PImage skiImg, snowboardImg;
PImage gameOverImg; 
PImage retryImg, retryHoverImg;
PImage mainMenuImg, mainMenuHoverImg;

int buttonWidth = 313;
int buttonHeight = 101;

int buttonWidth2 = 114;
int buttonHeight2 = 90;

PImage playButtonImg, playButtonHoverImg; // Изображение кнопки "Играть" при наведении

int currentState = 0; // 0 - главное меню, 1 - игра, 2 - конец игры, 3 - выбор персонажей, 4 - правила


PImage snoopyImage;     // Изображение сноубордиста
PImage skierImage;      // Изображение лыжника
PImage currentCharacterImage; // Изображение выбранного персонажа
int selectedCharacter = 0; // 0 - сноубордист, 1 - лыжник


PImage snoopyJumpImage; 
PImage snoopyCtrlImage; 
PImage skierJumpImage; 
PImage skierCtrlImage; 
PImage log1Image;
PImage log2Image;
PImage snowballImage;  

int snoopyY;             // Y-координата
int snoopyHeight = 162;  
int snoopyWidth = 238;   
int snoopyJumpHeight = 194; 
int snoopyJumpWidth = 195;  
int snoopyCtrlHeight = 104; 
int snoopyCtrlWidth = 300;  


int skierY;
int skierHeight = 147;  
int skierWidth = 185;   
int skierJumpHeight = 191;  
int skierJumpWidth = 189;  
int skierCtrlHeight = 127; 
int skierCtrlWidth = 203;  

boolean jumping = false;    // Флаг для прыжка
float jumpSpeed = 25;       // Начальная скорость прыжка
float gravity = 0.8;        // Сила тяжести
float velocityY = 0;        // Вертикальная скорость 
int logX;                  // X-координата препятствия
int log1Width = 230;       // Ширина препятствия
int log1Height = 100;      // Высота препятствия
int log2Width = 100;       
int log2Height = 107;      
int logSpeed = 18;         // Скорость движения брёвен
int snowballSpeed = 28;     // Скорость движения снежков
boolean showLog;            // Флаг для определения, какое бревно показывать
float snowballX;           // X позиция снежка
float snowballY;           // Y позиция снежка
float snowballWidth = 62;  // Ширина снежка
float snowballHeight = 63; // Высота снежка
boolean isSnowballActive = false; // Флаг активности снежков

// Переменные для управления частотой появления снежков
int lastSnowballTime = 0;  // Время последнего появления снежка
int minSnowballInterval = 500;  // Минимальный интервал между снежками (в миллисекундах)

float distance = 0; // Переменная для хранения расстояния

int jumpCount = 0; // Счётчик прыжков


void setup() {
  // Загрузка шрифта с жирным стилем
    myFont = createFont("font/Montserrat-Bold.ttf", 32); 
    textFont(myFont); // Устанавливаем шрифт
  
  
  minim = new Minim(this);
  player = minim.loadFile("sound/sound.mp3"); 
  player.setGain(-10); // Уменьшаем громкость на 10 дБ
  
  collisionLogSound = minim.loadFile("sound/tree_punch.wav");
  collisionLogSound.setGain(30);
  collisionSnowballSound = minim.loadFile("sound/snowball.wav");
  collisionSnowballSound.setGain(30);
  jumpSound = minim.loadFile("sound/jump3.wav");
  ctrlSound = minim.loadFile("sound/down.wav");
  ctrlSound.setGain(100); 
  clickSound = minim.loadFile("sound/click3.wav");
  clickSound.setGain(100);
  mainSound = minim.loadFile("sound/menu.mp3");
  
  
  size(1252, 950); 
  snoopyY = height - snoopyHeight - 30; // Начальная позиция снупи
  skierY = height - skierHeight - 30; // Начальная позиция снупи
  logX = width;             // Начальная позиция препятствия
  
  
  backgroundImg = loadImage("img/фон.jpg");
  name = loadImage("img/name.png");
  playImg = loadImage("img/play.png");
  playHoverImg = loadImage("img/play_hover.png");
  settingsImg = loadImage("img/settings.png");
  settingsHoverImg = loadImage("img/settings_hover.png");
  rulesImg = loadImage("img/rules.png");
  rulesHoverImg = loadImage("img/rules_hover.png");
  soundImg = loadImage("img/sound.png");
  soundHoverImg = loadImage("img/sound_hover.png");
  musicImg = loadImage("img/music.png");
  musicHoverImg = loadImage("img/music_hover.png");
  noSoundImg = loadImage("img/nosound.png");
  noSoundHoverImg = loadImage("img/nosound_hover.png");
  noMusicImg = loadImage("img/nomusic.png");
  noMusicHoverImg = loadImage("img/nomusic_hover.png");
  characterPageImg = loadImage("img/character_page.png"); 
  rulesPageImg = loadImage("img/rules_page.png"); 
  backButtonImg = loadImage("img/arrow.png");
  backButtonHoverImg = loadImage("img/arrow_hover.png");
  skiButtonImg = loadImage("img/button_ski.png");
  skiButtonHoverImg = loadImage("img/button_ski_hover.png");
  boardButtonImg = loadImage("img/button_board.png");
  boardButtonHoverImg = loadImage("img/button_board_hover.png");
  skiImg = loadImage("img/лыжник.png");
  snowboardImg = loadImage("img/сноубордист.png");
  playButtonImg = loadImage("img/start.png");
  playButtonHoverImg = loadImage("img/start_hover.png"); 
  gameOverImg = loadImage("img/back.png"); 
  retryImg = loadImage("img/again.png");
  retryHoverImg = loadImage("img/again_hover.png");
  mainMenuImg = loadImage("img/main.png");
  mainMenuHoverImg = loadImage("img/main_hover.png");
  
  
  snoopyImage = loadImage("img/snoopy snowboard.png"); 
  snoopyJumpImage = loadImage("img/jump snowboard.png"); 
  snoopyCtrlImage = loadImage("img/ctrl snowboard.png"); 
  skierImage = loadImage("img/skier.png"); 
  skierJumpImage = loadImage("img/лыжник прыгает.png"); 
  skierCtrlImage = loadImage("img/skier_ctrl.png");
  log1Image = loadImage("img/бревно2.png");
  log2Image = loadImage("img/бревно1.png");
  snowballImage = loadImage("img/снежок.png");
  
  showLog = true;
  
  snowballX = width;        // Начинаем с правой стороны экрана
  snowballY = 550;   // Устанавливаем снежок 
}

void draw() {
  
  if (currentState == 0) {
    // Главное меню
    image(backgroundImg, 0, 0);
    drawMainMenu();

    if (isMusicOn) {
        if (!mainSound.isPlaying()) {
            mainSound.loop(); // Запускаем музыку в цикле, если она не играет
        }
    } else {
        if (mainSound.isPlaying()) {
            mainSound.pause(); // Останавливаем музыку, если она играет
        }
    }
} else if (currentState == 1) {
    // Игровой экран
    drawGame();
    if (mainSound.isPlaying()) {
        mainSound.pause(); 
    }
} else if (currentState == 2) {
    // Экран проигрыша
    drawGameOver();
} else if (currentState == 3) {
    // Выбор персонажей
    image(characterPageImg, 0, 0);
    backButton(); // Отображение кнопки "Назад"
    drawSettings();
} else if (currentState == 4) {
    // Страница с правилами
    image(rulesPageImg, 0, 0);
    backButton(); 
}
}


void drawGameOver() {
    // Отображение экрана проигрыша
    image(gameOverImg, 0, 0);
    
    // Отображение кнопок "Еще раз" и "Главное меню"
    if (isMouseOver(470, 354, 312, 101)) {
        image(retryHoverImg, 470, 354); // Изображение кнопки "Еще раз" при наведении
    } else {
        image(retryImg, 470, 354); // Изображение кнопки "Еще раз"
    }
    
    if (isMouseOver(470, 495, 312, 101)) {
        image(mainMenuHoverImg, 470, 495); // Изображение кнопки "Главное меню" при наведении
    } else {
        image(mainMenuImg, 470, 495); // Изображение кнопки "Главное меню"
    }
}

void drawMainMenu() {
  // Отображение главного экрана
  image(backgroundImg, 0, 0);
  
  image(name, 805, 220);
  
  // Проверка наведения курсора на кнопки
  if (isMouseOver(826, 380, buttonWidth, buttonHeight)) {
    image(playHoverImg, 826, 380);
  } else {
    image(playImg, 826, 380);
  }
  
  if (isMouseOver(826, 516, buttonWidth, buttonHeight)) {
    image(settingsHoverImg, 826, 516);
  } else {
    image(settingsImg, 826, 516);
  }
  
  if (isMouseOver(826, 652, buttonWidth, buttonHeight)) {
    image(rulesHoverImg, 826, 652);
  } else {
    image(rulesImg, 826, 652);
  }
  
  //if (isMouseOver(856, 788, buttonWidth2, buttonHeight2)) {
    //image(soundHoverImg, 856, 788);
  //} else {
    //image(soundImg, 856, 788);
  //}
  
  //if (isMouseOver(995, 788, buttonWidth2, buttonHeight2)) {
    //image(musicHoverImg, 995, 788);
  //} else {
    //image(musicImg, 995, 788);
  //}
  
  // Отображение кнопок звука и музыки
    drawSoundButton();
    drawMusicButton();
 
}

void drawSoundButton() {
    // Отображение кнопки звука
    if (isMouseOver(856, 788, buttonWidth2, buttonHeight2)) {
        if (isSoundOn) {
            image(soundHoverImg, 856, 788); // Изображение при наведении, когда музыка включена
        } else {
            image(noSoundHoverImg, 856, 788); // Изображение при наведении, когда музыка выключена
        }
    } else {
        image(isSoundOn ? soundImg : noSoundImg, 856, 788); // Изображение в зависимости от состояния
    }
}

void drawMusicButton() {
    // Отображение кнопки музыки
    if (isMouseOver(995, 788, buttonWidth2, buttonHeight2)) {
        if (isMusicOn) {
            image(musicHoverImg, 995, 788); // Изображение при наведении, когда музыка включена
        } else {
            image(noMusicHoverImg, 995, 788); // Изображение при наведении, когда музыка выключена
        }
    } else {
        image(isMusicOn ? musicImg : noMusicImg, 995, 788); // Изображение в зависимости от состояния
    }
}


void backButton() {
  // Отображение кнопки "Назад"
  if (isMouseOver(40, 40, 50, 50)) {
    image(backButtonHoverImg, 40, 40);
  } else {
    image(backButtonImg, 40, 40);
  }
}

void drawSettings() {

  // Отображение кнопок настроек
  if (isMouseOver(110, 330, 452, 115)) {
    image(skiButtonHoverImg, 110, 330);
  } else {
    image(skiButtonImg, 110, 330);
  }
  
  if (isMouseOver(690, 330, 452, 115)) {
    image(boardButtonHoverImg, 690, 330);
  } else {
    image(boardButtonImg, 690, 330);
  }

  image (skiImg, 148, 535);
  image (snowboardImg, 703, 512);
}

void drawGame() { 
  
  background(#c6cddd);
  
  
  //Горы
  fill(#919ac5);
  noStroke();
  beginShape();
  vertex(238, 191);
  bezierVertex(270, 231, 293, 259, 315, 281);
  bezierVertex(338, 305, 378, 321, 415, 331);
  bezierVertex(410, 352, 398, 374, 382, 383);
  bezierVertex(362, 401, 320, 413, 264, 420);
  bezierVertex(234, 492, 180, 535, 126, 551);
  bezierVertex(89, 525, 59, 484, 53, 448);
  endShape();
  
  beginShape();
  vertex(289, 402);
  bezierVertex(327, 435, 327, 481, 283, 527);
  bezierVertex(247, 537, 203, 540, 160, 529);
  bezierVertex(184, 480, 214, 437, 289, 402);
  endShape();
  
  fill(#a1a9d7);
  noStroke();
  beginShape();
  vertex(21, 396);
  bezierVertex(65, 358, 91, 320, 120, 268);
  bezierVertex(158, 267, 197, 247, 210, 224);
  bezierVertex(224, 213, 238, 192, 238, 189);
  bezierVertex(234, 220, 230, 242, 219, 261);
  bezierVertex(198, 297, 174, 324, 136, 355);
  bezierVertex(132, 368, 128, 389, 141, 410);
  bezierVertex(152, 410, 162, 402, 175, 405);
  bezierVertex(176, 406, 183, 407, 182, 412);
  bezierVertex(179, 427, 171, 435, 140, 455);
  bezierVertex(123, 452, 108, 473, 107, 502);
  bezierVertex(66, 488, 40, 462, 25, 423);
  endShape();
  
  
  fill(#aeaacf);
  beginShape();
  vertex(962, 328);
  bezierVertex(970, 336, 995, 377, 1019, 432);
  bezierVertex(1024, 434, 1030, 442, 1035, 446);
  bezierVertex(1038, 450, 1043, 455, 1046, 451);
  bezierVertex(1063, 434, 1080, 417, 1098, 392);
  bezierVertex(1116, 371, 1132, 350, 1162, 339);
  bezierVertex(1173, 338, 1207, 333, 1252, 330);
  bezierVertex(1052, 500, 1052, 550, 1185, 650);
  bezierVertex(1070, 678, 939, 668, 881, 569);
  bezierVertex(894, 464, 904, 378, 933, 348);
  endShape();
  
  fill(#aeaacf);
  ellipse(1215, 362, 40, 50);
  
  
  fill(#b3b4d2);
  beginShape();
  vertex(851, 312);
  bezierVertex(877, 317, 909, 317, 943, 319);
  bezierVertex(948, 318, 956, 319, 958, 324);
  bezierVertex(960, 325, 962, 328, 962, 340);//
  bezierVertex(961, 350, 952, 377, 944, 392);
  bezierVertex(939, 401, 937, 404, 940, 408);
  bezierVertex(948, 413, 963, 422, 995, 442);
  bezierVertex(989, 495, 989, 621, 974, 753);
  bezierVertex(756, 763, 661, 734, 646, 634);
  bezierVertex(677, 539, 715, 470, 774, 393);
  endShape();
  
  
  fill(#a1a9d7);
  beginShape();
  vertex(497, 596);
  bezierVertex(522, 500, 575, 500, 581, 609);
  bezierVertex(568, 664, 497, 670, 479, 608);
  endShape();
  
  
  fill(#8a98c5);
  beginShape();
  vertex(695, 116);
  bezierVertex(736, 166, 775, 229, 802, 268);
  bezierVertex(812, 281, 828, 297, 851, 312);
  bezierVertex(829, 423, 825, 459, 813, 494);
  bezierVertex(802, 520, 789, 540, 771, 544);
  bezierVertex(762, 527, 761, 503, 761, 486);
  bezierVertex(762, 478, 761, 460, 761, 455);
  bezierVertex(760, 450, 759, 445, 755, 449);
  bezierVertex(744, 463, 724, 493, 703, 534);
  bezierVertex(696, 554, 691, 571, 697, 593);
  bezierVertex(704, 612, 707, 632, 705, 652);
  bezierVertex(696, 676, 663, 702, 602, 691);
  bezierVertex(578, 649, 571, 596, 561, 570);
  bezierVertex(559, 565, 553, 549, 548, 537);
  bezierVertex(547, 534, 545, 528, 539, 532);
  bezierVertex(529, 541, 521, 552, 509, 571);
  bezierVertex(474, 647, 398, 725, 321, 661);
  endShape();
  fill(#8a98c5);
  beginShape();
  vertex(166, 711);
  bezierVertex(179, 670, 128, 664, 109, 688);
  bezierVertex(110, 711, 149, 728, 166, 711);
  endShape();
  
  fill(#b3b4d2);
  beginShape();
  vertex(851, 312);
  bezierVertex(843, 327, 832, 349, 830, 376);
  bezierVertex(830, 385, 834, 404, 833, 420);
  endShape();
  
  
  fill(#a1a9d7);
  noStroke();
  beginShape();
  vertex(144, 688);
  bezierVertex(137, 633, 134, 584, 139, 540);
  bezierVertex(165, 532, 188, 518, 235, 510);
  bezierVertex(281, 516, 295, 501, 303, 476);
  bezierVertex(294, 468, 273, 447, 273, 416);
  bezierVertex(291, 417, 330, 412, 380, 378);
  bezierVertex(389, 374, 402, 354, 414, 328);
  bezierVertex(422, 319, 430, 300, 438, 290);
  bezierVertex(442, 284, 446, 283, 448, 282);
  bezierVertex(456, 282, 464, 281, 475, 280);
  bezierVertex(483, 280, 487, 276, 490, 269);
  bezierVertex(491, 267, 501, 254, 503, 254);
  bezierVertex(507, 251, 511, 251, 514, 254);
  bezierVertex(519, 259, 527, 271, 537, 282);
  bezierVertex(544, 287, 546, 288, 555, 284);
  bezierVertex(555, 285, 566, 271, 573, 251);
  bezierVertex(582, 234, 603, 196, 623, 182);
  bezierVertex(632, 177, 637, 173, 641, 165);
  bezierVertex(650, 147, 667, 122, 672, 116);
  bezierVertex(674, 115, 684, 100, 695, 116); //
  bezierVertex(702, 123, 699, 155, 678, 195);
  bezierVertex(653, 233, 637, 288, 666, 353);
  bezierVertex(669, 358, 670, 364, 669, 370);
  bezierVertex(665, 390, 650, 413, 616, 428);
  bezierVertex(602, 434, 580, 430, 564, 423);
  bezierVertex(556, 419, 536, 418, 524, 430);
  bezierVertex(520, 432, 509, 457, 508, 501);
  bezierVertex(492, 523, 494, 549, 504, 577);
  endShape();
  
  
  
  //Елки
  
  //Задний план
  fill(#707396);
  beginShape();
  vertex(938, 471);
  bezierVertex(943, 495, 950, 509, 971, 526);
  bezierVertex(960, 529, 952, 519, 949, 517);
  bezierVertex(952, 526, 959, 544, 969, 557);
  bezierVertex(965, 559, 962, 555, 958, 555);
  bezierVertex(961, 565, 966, 571, 974, 578);
  bezierVertex(984, 624, 983, 704, 964, 738);
  bezierVertex(916, 735, 873, 714, 881, 647);
  bezierVertex(892, 642, 897, 633, 901, 623);
  bezierVertex(899, 622, 898, 624, 888, 625);
  bezierVertex(895, 615, 906, 599, 915, 581);
  bezierVertex(910, 583, 909, 585, 903, 588);
  bezierVertex(907, 578, 911, 572, 916, 559);
  bezierVertex(912, 564, 908, 569, 895, 576);
  bezierVertex(905, 565, 913, 553, 922, 533);
  bezierVertex(920, 534, 920, 535, 912, 540);
  bezierVertex(916, 534, 920, 529, 926, 519);
  bezierVertex(922, 520, 919, 521, 911, 523);
  bezierVertex(921, 510, 932, 494, 940, 471);
  endShape();
  
  fill(#8183a9);
  beginShape();
  vertex(959, 550);
  bezierVertex(963, 563, 966, 576, 967, 574);
  bezierVertex(972, 607, 972, 660, 966, 718);
  bezierVertex(953, 718, 932, 726, 914, 722);
  bezierVertex(919, 715, 924, 711, 926, 705);
  bezierVertex(921, 710, 917, 713, 911, 715);
  bezierVertex(917, 704, 923, 693, 930, 673);
  bezierVertex(926, 677, 923, 678, 919, 681);
  bezierVertex(927, 661, 934, 644, 940, 625);
  bezierVertex(937, 627, 934, 630, 929, 634);
  bezierVertex(940, 614, 952, 586, 959, 550);
  endShape();
  
  fill(#707396);
  beginShape();
  vertex(760, 487);
  bezierVertex(764, 506, 771, 523, 791, 545);
  bezierVertex(785, 544, 774, 535, 770, 530);
  bezierVertex(773, 544, 781, 562, 796, 579);
  bezierVertex(792, 578, 790, 576, 786, 574);
  bezierVertex(788, 581, 791, 584, 797, 597);
  bezierVertex(790, 592, 787, 590, 779, 585);
  bezierVertex(786, 599, 797, 617, 819, 642);
  bezierVertex(826, 680, 820, 732, 750, 745);
  bezierVertex(707, 729, 697, 692, 705, 675);
  bezierVertex(711, 665, 717, 652, 722, 639);
  bezierVertex(718, 640, 715, 643, 709, 644);
  bezierVertex(717, 631, 727, 614, 733, 598);
  bezierVertex(730, 600, 728, 603, 722, 603);
  bezierVertex(729, 596, 733, 588, 738, 575);
  bezierVertex(733, 581, 729, 586, 718, 590);
  bezierVertex(724, 583, 734, 571, 744, 548);
  bezierVertex(741, 549, 740, 552, 734, 555);
  bezierVertex(737, 549, 743, 544, 749, 531);
  bezierVertex(744, 534, 743, 536, 733, 536);
  bezierVertex(742, 527, 754, 510, 760, 487);
  endShape();
  
  fill(#8183a9);
  beginShape();
  vertex(851, 482);
  bezierVertex(864, 527, 876, 558, 891, 586);
  bezierVertex(885, 584, 881, 580, 875, 574);
  bezierVertex(882, 598, 890, 624, 904, 654);
  bezierVertex(901, 657, 895, 651, 894, 652);
  bezierVertex(898, 666, 907, 683, 919, 702);
  bezierVertex(917, 701, 909, 697, 905, 694);
  bezierVertex(909, 702, 912, 709, 920, 720);
  bezierVertex(892, 740, 829, 746, 780, 733);
  bezierVertex(787, 719, 791, 713, 795, 704);
  bezierVertex(792, 706, 788, 707, 782, 706);
  bezierVertex(789, 691, 800, 674, 810, 650);
  bezierVertex(803, 653, 803, 655, 788, 658);
  bezierVertex(798, 645, 812, 619, 825, 579);
  bezierVertex(824, 579, 820, 581, 811, 586);
  bezierVertex(822, 568, 835, 541, 851, 482);
  endShape();
  
  fill(#707396);
  beginShape();
  vertex(670, 547);
  bezierVertex(674, 570, 683, 588, 696, 604);
  bezierVertex(693, 602, 688, 599, 679, 590);
  bezierVertex(682, 603, 689, 618, 706, 639);
  bezierVertex(699, 635, 694, 632, 690, 629);
  bezierVertex(695, 648, 700, 681, 717, 734);
  bezierVertex(688, 731, 632, 727, 627, 693);
  bezierVertex(631, 683, 639, 669, 644, 657);
  bezierVertex(642, 658, 639, 660, 633, 664);
  bezierVertex(635, 657, 642, 648, 647, 634);
  bezierVertex(643, 638, 638, 645, 626, 651);
  bezierVertex(631, 643, 642, 631, 654, 610);
  bezierVertex(650, 609, 650, 610, 645, 610);
  bezierVertex(646, 610, 648, 606, 656, 594);
  bezierVertex(653, 594, 649, 595, 642, 596);
  bezierVertex(651, 588, 662, 572, 670, 547);
  endShape();
  
  fill(#8183a9);
  beginShape();
  vertex(693, 630);
  bezierVertex(697, 643, 700, 648, 710, 658);
  bezierVertex(709, 660, 706, 658, 704, 657);
  bezierVertex(707, 663, 711, 668, 704, 666);
  bezierVertex(705, 672, 711, 680, 718, 692);
  bezierVertex(717, 696, 714, 691, 708, 688);
  bezierVertex(712, 693, 713, 696, 719, 702);
  bezierVertex(716, 704, 713, 702, 709, 700);
  bezierVertex(713, 709, 717, 713, 726, 731);
  bezierVertex(699, 731, 675, 729, 662, 720);
  bezierVertex(668, 707, 671, 701, 676, 695);
  bezierVertex(676, 694, 674, 694, 666, 698);
  bezierVertex(670, 693, 674, 689, 675, 687);
  bezierVertex(674, 687, 670, 688, 666, 687);
  bezierVertex(671, 682, 678, 674, 685, 657);
  bezierVertex(683, 659, 681, 661, 674, 665);
  bezierVertex(680, 656, 687, 647, 693, 630);
  endShape();
  
  fill(#707396);
  beginShape();
  vertex(217, 448);
  bezierVertex(220, 465, 225, 474, 233, 482);
  bezierVertex(247, 567, 244, 678, 236, 706);
  bezierVertex(218, 698, 188, 696, 154, 697);
  bezierVertex(164, 674, 175, 654, 182, 626);
  bezierVertex(178, 628, 173, 632, 159, 644);
  bezierVertex(166, 631, 177, 607, 186, 582);
  bezierVertex(183, 583, 177, 593, 162, 609);
  bezierVertex(170, 593, 182, 573, 196, 548);
  bezierVertex(193, 550, 191, 551, 180, 557);
  bezierVertex(185, 550, 189, 544, 192, 537);
  bezierVertex(189, 537, 186, 538, 179, 542);
  bezierVertex(187, 533, 200, 517, 208, 492);
  bezierVertex(204, 496, 199, 498, 187, 505);
  bezierVertex(197, 497, 214, 474, 217, 448);
  endShape();
  
  fill(#707396);
  beginShape();
  vertex(433, 436);
  bezierVertex(443, 477, 454, 512, 473, 550);
  bezierVertex(467, 547, 465, 542, 458, 537);
  bezierVertex(462, 550, 469, 569, 484, 594);
  bezierVertex(493, 648, 484, 715, 395, 719);
  bezierVertex(379, 708, 364, 684, 366, 664);
  bezierVertex(373, 652, 382, 636, 387, 621);
  bezierVertex(382, 622, 379, 622, 372, 621);
  bezierVertex(384, 600, 396, 570, 404, 539);
  bezierVertex(401, 543, 398, 543, 391, 548);
  bezierVertex(403, 524, 417, 486, 433, 436);
  endShape();
  
  fill(#707396);
  beginShape();
  vertex(568, 536);
  bezierVertex(573, 550, 575, 558, 580, 571);
  bezierVertex(591, 608, 593, 646, 591, 698);
  bezierVertex(562, 704, 525, 692, 539, 638);
  bezierVertex(540, 639, 545, 623, 550, 606);
  bezierVertex(548, 605, 546, 607, 541, 608);
  bezierVertex(550, 590, 560, 564, 568, 536);
  endShape();
  
  fill(#8183a9);/////
  beginShape();
  vertex(585, 530);
  bezierVertex(590, 551, 597, 562, 612, 581);
  bezierVertex(606, 580, 604, 579, 597, 572);
  bezierVertex(600, 578, 603, 585, 614, 602);
  bezierVertex(606, 596, 603, 591, 598, 588);
  bezierVertex(601, 595, 612, 613, 627, 632);
  bezierVertex(620, 630, 615, 625, 607, 617);
  bezierVertex(610, 627, 614, 634, 621, 645);
  bezierVertex(616, 644, 615, 642, 613, 640);
  bezierVertex(615, 650, 624, 670, 636, 689);
  bezierVertex(631, 687, 628, 686, 624, 683);
  bezierVertex(630, 693, 636, 706, 650, 723);
  bezierVertex(612, 727, 557, 723, 539, 710);
  bezierVertex(542, 695, 548, 682, 554, 671);
  bezierVertex(549, 673, 548, 674, 542, 674);
  bezierVertex(544, 668, 553, 653, 562, 632);
  bezierVertex(559, 635, 556, 636, 547, 640);
  bezierVertex(551, 633, 555, 628, 560, 621);
  bezierVertex(557, 622, 555, 622, 548, 624);
  bezierVertex(557, 613, 564, 603, 573, 580);
  bezierVertex(569, 584, 564, 588, 554, 592);
  bezierVertex(562, 581, 577, 564, 585, 530);
  endShape();
  
  fill(#8183a9);
  beginShape();
  vertex(494, 470);
  bezierVertex(499, 491, 509, 504, 522, 520);
  bezierVertex(518, 521, 514, 518, 510, 515);
  bezierVertex(512, 524, 516, 531, 523, 538);
  bezierVertex(519, 538, 515, 536, 511, 532);
  bezierVertex(516, 545, 523, 554, 539, 573);
  bezierVertex(531, 573, 525, 565, 519, 561);
  bezierVertex(522, 571, 527, 578, 533, 588);
  bezierVertex(528, 586, 524, 584, 519, 578);
  bezierVertex(527, 596, 534, 609, 549, 627);
  bezierVertex(544, 628, 538, 625, 530, 621);
  bezierVertex(538, 634, 547, 648, 561, 672);
  bezierVertex(555, 673, 546, 666, 538, 658);
  bezierVertex(541, 668, 550, 683, 582, 728);
  bezierVertex(523, 734, 456, 730, 444, 701);
  bezierVertex(445, 686, 451, 671, 457, 664);
  bezierVertex(457, 661, 458, 654, 458, 645);
  bezierVertex(457, 649, 453, 653, 442, 652);
  bezierVertex(448, 640, 455, 625, 459, 608);
  bezierVertex(455, 614, 450, 624, 441, 633);
  bezierVertex(449, 613, 461, 593, 474, 569);
  bezierVertex(473, 569, 469, 571, 458, 577);
  bezierVertex(462, 573, 469, 565, 472, 556);
  bezierVertex(469, 557, 467, 560, 460, 561);
  bezierVertex(468, 552, 478, 538, 485, 515);
  bezierVertex(480, 521, 476, 522, 466, 528);
  bezierVertex(476, 516, 489, 498, 494, 470);
  endShape();
  
  fill(#8183a9);
  beginShape();
  vertex(421, 560);
  bezierVertex(426, 572, 432, 580, 441, 590);
  bezierVertex(439, 591, 435, 590, 433, 588);
  bezierVertex(436, 594, 438, 596, 443, 601);
  bezierVertex(439, 602, 437, 601, 433, 600);
  bezierVertex(438, 607, 446, 616, 456, 628);
  bezierVertex(450, 627, 447, 625, 441, 621);
  bezierVertex(445, 626, 449, 630, 455, 637);
  bezierVertex(449, 636, 445, 634, 439, 630);
  bezierVertex(446, 638, 453, 645, 461, 661);
  bezierVertex(453, 660, 452, 659, 448, 657);
  bezierVertex(453, 663, 462, 669, 474, 691);
  bezierVertex(488, 720, 401, 723, 385, 705);
  bezierVertex(392, 689, 395, 680, 396, 673);
  bezierVertex(391, 676, 388, 679, 379, 683);
  bezierVertex(383, 674, 389, 663, 395, 653);
  bezierVertex(393, 652, 389, 656, 382, 659);
  bezierVertex(388, 651, 396, 640, 404, 627);
  bezierVertex(402, 627, 399, 628, 391, 631);
  bezierVertex(395, 625, 400, 621, 402, 618);
  bezierVertex(399, 620, 397, 619, 392, 621);
  bezierVertex(398, 614, 408, 602, 413, 591);
  bezierVertex(410, 592, 408, 594, 399, 598);
  bezierVertex(407, 586, 416, 578, 421, 560);
  endShape();
  
  fill(#8183a9);
  beginShape();
  vertex(316, 454);
  bezierVertex(319, 469, 327, 486, 345, 506);
  bezierVertex(339, 505, 335, 503, 330, 500);
  bezierVertex(331, 506, 336, 514, 343, 521);
  bezierVertex(338, 522, 336, 519, 333, 518);
  bezierVertex(337, 528, 346, 544, 361, 559);
  bezierVertex(353, 557, 345, 549, 339, 544);
  bezierVertex(341, 551, 346, 558, 353, 573);
  bezierVertex(349, 570, 346, 567, 341, 562);
  bezierVertex(346, 577, 358, 595, 369, 614);
  bezierVertex(362, 612, 360, 609, 355, 607);
  bezierVertex(360, 620, 369, 638, 380, 660);
  bezierVertex(371, 654, 365, 649, 359, 641);
  bezierVertex(362, 655, 377, 674, 399, 703);
  bezierVertex(365, 704, 306, 714, 258, 689);
  bezierVertex(271, 672, 271, 628, 281, 579);
  bezierVertex(287, 568, 290, 564, 293, 557);
  bezierVertex(291, 558, 287, 562, 280, 563);
  bezierVertex(286, 556, 287, 551, 291, 545);
  bezierVertex(288, 544, 285, 545, 279, 545);
  bezierVertex(291, 536, 300, 522, 308, 502);
  bezierVertex(304, 503, 301, 506, 289, 512);
  bezierVertex(299, 501, 311, 480, 316, 454);
  endShape();
  
  fill(#8183a9);
  beginShape();
  vertex(212, 545);
  bezierVertex(218, 557, 224, 566, 232, 574);
  bezierVertex(230, 576, 226, 575, 222, 572);
  bezierVertex(227, 579, 229, 580, 232, 584);
  bezierVertex(230, 591, 229, 589, 226, 590);
  bezierVertex(228, 590, 231, 594, 237, 604);
  bezierVertex(230, 604, 229, 605, 227, 602);
  bezierVertex(232, 510, 241, 652, 237, 702);
  bezierVertex(220, 697, 191, 695, 177, 698);
  bezierVertex(182, 677, 185, 668, 186, 659);
  bezierVertex(183, 663, 181, 665, 174, 665);
  bezierVertex(180, 657, 186, 645, 188, 632);
  bezierVertex(186, 636, 185, 637, 181, 638);
  bezierVertex(183, 630, 189, 619, 196, 607);
  bezierVertex(195, 609, 193, 611, 188, 612);
  bezierVertex(190, 610, 193, 607, 196, 602);
  bezierVertex(193, 602, 194, 606, 196, 601);
  bezierVertex(192, 601, 190, 604, 187, 602);
  bezierVertex(191, 597, 200, 587, 203, 574);
  bezierVertex(200, 577, 198, 576, 191, 579);
  bezierVertex(201, 569, 208, 557, 212, 545);
  endShape();
  
  
  //1
  fill(#282844);
  beginShape();
  vertex(15, 577);
  bezierVertex(40, 578, 70, 590, 102, 590);
  bezierVertex(111, 604, 132, 630, 155, 642);
  bezierVertex(164, 653, 174, 660, 180, 668);
  bezierVertex(184, 673, 182, 678, 176, 678);
  bezierVertex(170, 678, 159, 676, 144, 667);
  bezierVertex(119, 686, 54, 691, 0, 691);
  endShape();
  
  fill(#434774);
  beginShape();
  vertex(13, 518);
  bezierVertex(31, 518, 66, 520, 100, 522);
  bezierVertex(95, 540, 95, 580, 95, 599);
  bezierVertex(92, 601, 90, 597, 87, 593);
  bezierVertex(85, 597, 76, 603, 65, 593);
  bezierVertex(62, 595, 57, 600, 46, 594);
  bezierVertex(43, 599, 36, 601, 29, 593);
  bezierVertex(24, 599, 17, 601, 13, 518);
  endShape();
  
  fill(#373a5d);
  beginShape();
  vertex(70, 463);
  bezierVertex(81, 476, 86, 486, 95, 495);
  bezierVertex(95, 510, 95, 520, 95, 529);
  bezierVertex(91, 532, 84, 528, 83, 523);
  bezierVertex(84, 529, 83, 536, 73, 530);
  bezierVertex(69, 532, 65, 536, 55, 527);
  bezierVertex(54, 529, 49, 536, 42, 527);
  bezierVertex(41, 532, 34, 535, 25, 527);
  bezierVertex(18, 506, 18, 481, 18, 449);
  endShape();
  
  fill(#4f5788);
  noStroke();
  beginShape();
  vertex(28, 402);
  bezierVertex(35, 393, 41, 371, 43, 361);
  bezierVertex(43, 358, 45, 357, 48, 359);
  bezierVertex(49, 366, 54, 402, 72, 435);
  bezierVertex(66, 428, 73, 439, 92, 457);
  bezierVertex(92, 460, 90, 463, 90, 468);
  bezierVertex(86, 462, 84, 460, 79, 456);
  bezierVertex(79, 457, 83, 457, 90, 461);
  bezierVertex(90, 463, 90, 465, 90, 467);
  bezierVertex(85, 464, 81, 460, 80, 458);
  bezierVertex(78, 459, 81, 462, 83, 465);
  bezierVertex(85, 469, 84, 471, 77, 468);
  bezierVertex(74, 470, 71, 475, 65, 467);
  bezierVertex(64, 468, 59, 475, 52, 467);
  bezierVertex(52, 468, 47, 472, 42, 468);
  bezierVertex(41, 470, 32, 472, 28, 465);
  bezierVertex(19, 445, 19, 417, 28, 402);
  endShape();
  
  
  //2
  fill(#272844);
  beginShape();
  vertex(1008, 623);
  bezierVertex(1047, 626, 1081, 626, 1115, 622);
  bezierVertex(1145, 725, 1048, 731, 992, 720);
  bezierVertex(962, 712, 957, 707, 962, 702);
  endShape();
  
  fill(#373a5d);
  beginShape();
  vertex(1016, 564);
  bezierVertex(1047, 563, 1078, 561, 1114, 563);
  bezierVertex(1106, 588, 1110, 610, 1103, 627);
  bezierVertex(1098, 638, 1092, 645, 1082, 634);
  bezierVertex(1080, 638, 1074, 641, 1068, 634);
  bezierVertex(1066, 639, 1059, 643, 1055, 634);
  bezierVertex(1051, 640, 1046, 644, 1041, 636);
  bezierVertex(1038, 641, 1034, 646, 1025, 648);
  endShape();
  
  fill(#454674);
  beginShape();
  vertex(1087, 508);
  bezierVertex(1090, 519, 1096, 525, 1098, 525);
  bezierVertex(1098, 540, 1098, 560, 1098, 575);
  bezierVertex(1092, 577, 1092, 576, 1086, 574);
  bezierVertex(1084, 578, 1080, 581, 1075, 576);
  bezierVertex(1075, 577, 1071, 580, 1066, 576);
  bezierVertex(1064, 578, 1061, 581, 1054, 576);
  bezierVertex(1054, 579, 1049, 581, 1045, 577);
  bezierVertex(1042, 580, 1036, 584, 1032, 576);
  bezierVertex(1033, 578, 1025, 582, 1017, 577);
  bezierVertex(1020, 572, 1019, 558, 1024, 552);
  bezierVertex(1032, 542, 1036, 531, 1042, 518);
  bezierVertex(1051, 512, 1075, 508, 1087, 508);
  endShape();
  
  fill(#50578b);
  beginShape();
  vertex(1020, 512);
  bezierVertex(1041, 493, 1056, 459, 1064, 426);
  bezierVertex(1065, 420, 1067, 413, 1069, 420);
  bezierVertex(1070, 429, 1075, 462, 1095, 495);
  bezierVertex(1095, 505, 1095, 515, 1095, 525);
  bezierVertex(1092, 521, 1091, 520, 1088, 519);
  bezierVertex(1093, 522, 1087, 532, 1080, 520);
  bezierVertex(1079, 520, 1074, 527, 1071, 517);
  bezierVertex(1071, 519, 1067, 526, 1063, 517);
  bezierVertex(1063, 521, 1057, 526, 1054, 518);
  bezierVertex(1055, 522, 1050, 526, 1046, 521);
  bezierVertex(1046, 524, 1040, 526, 1038, 521);
  bezierVertex(1037, 521, 1028, 524, 1030, 518);
  bezierVertex(1028, 518, 1022, 521, 1020, 512);
  endShape();
  
  
  //3
  fill(#272846);
  beginShape();
  vertex(1145, 712);
  bezierVertex(1138, 655, 1134, 603, 1135, 573);
  bezierVertex(1159, 570, 1178, 567, 1211, 569);
  bezierVertex(1214, 607, 1213, 659, 1206, 702);
  bezierVertex(1182, 709, 1152, 702, 1145, 712);
  endShape();
  
  fill(#3a3860);
  beginShape();
  vertex(1143, 498);
  bezierVertex(1139, 525, 1141, 558, 1148, 590);
  bezierVertex(1159, 486, 1181, 493, 1214, 495);
  bezierVertex(1212, 537, 1209, 566, 1196, 586);
  bezierVertex(1189, 595, 1184, 592, 1178, 587);
  bezierVertex(1173, 591, 1167, 597, 1156, 592);
  bezierVertex(1144, 582, 1141, 530, 1143, 498);
  endShape();
  beginShape();
  vertex(1152, 556);
  bezierVertex(1131, 539, 1133, 510, 1165, 487);
  bezierVertex(1167, 492, 1187, 510, 1152, 556);
  endShape();
  
  
  fill(#434776);
  beginShape();
  vertex(1142, 421);
  bezierVertex(1166, 425, 1196, 424, 1231, 423);
  bezierVertex(1216, 461, 1211, 490, 1204, 512);
  bezierVertex(1202, 513, 1199, 513, 1195, 508);
  bezierVertex(1191, 511, 1183, 518, 1180, 508);
  bezierVertex(1177, 509, 1167, 519, 1162, 508);
  bezierVertex(1158, 515, 1157, 516, 1152, 519);
  endShape();
  
  fill(#4d598b);
  beginShape();
  vertex(1147, 413);
  bezierVertex(1164, 396, 1182, 357, 1192, 319);
  bezierVertex(1194, 310, 1197, 305, 1200, 310);
  bezierVertex(1201, 311, 1206, 353, 1218, 379);
  bezierVertex(1223, 410, 1222, 426, 1217, 437);
  bezierVertex(1208, 441, 1206, 438, 1205, 432);
  bezierVertex(1203, 438, 1199, 441, 1193, 435);
  bezierVertex(1192, 439, 1186, 445, 1182, 438);
  bezierVertex(1180, 439, 1174, 445, 1168, 437);
  bezierVertex(1160, 437, 1153, 440, 1142, 434);
  bezierVertex(1140, 427, 1144, 417, 1147, 413);
  endShape();
  
  
  //Снег
  fill(#ebeef3);
  noStroke();
  beginShape();
  vertex(149, 700);
  bezierVertex(256, 680, 376, 680, 553, 720);
  bezierVertex(548, 770, 640, 770, 767, 734);
  bezierVertex(834, 724, 930, 714, 1024, 723);
  bezierVertex(1055, 735, 1056, 769, 1020, 794);
  bezierVertex(790, 798, 495, 796, 186, 793);
  bezierVertex(169, 754, 166, 716, 149, 700);
  endShape();
  
  fill(#fcfafb);
  noStroke();
  beginShape();
  vertex(0, 645);
  bezierVertex(201, 716, 324, 742, 508, 724);
  bezierVertex(583, 710, 700, 716, 803, 738);
  bezierVertex(863, 756, 962, 737, 989, 725);
  bezierVertex(1049, 705, 1176, 680, 1252, 670);
  bezierVertex(1252, 750, 1252, 800, 1252, 950);
  bezierVertex(823, 950, 370, 950, 0, 950);
  bezierVertex(0, 790, 0, 705, 0, 645);
  endShape();
  
  
  
  
  
  //Деревья
  fill(#0d232e);
  noStroke();
  beginShape();
  vertex(0, 687);
  bezierVertex(4, 692, 9, 694, 21, 695);
  bezierVertex(25, 546, 29, 437, 33, 249);
  bezierVertex(44, 232, 49, 211, 48, 186);
  bezierVertex(48, 166, 49, 155, 52, 146);
  bezierVertex(53, 142, 55, 132, 54, 118);
  bezierVertex(52, 124, 51, 132, 46, 153);
  bezierVertex(43, 159, 43, 173, 44, 184);
  bezierVertex(43, 196, 41, 212, 33, 233);
  bezierVertex(33, 166, 32, 101, 30, 0);
  bezierVertex(22, 0, 10, 0, 0, 0);
  endShape();
  
  fill(#133848);
  noStroke();
  beginShape();
  vertex(98, 726);
  bezierVertex(105, 723, 111, 724, 122, 730);
  bezierVertex(130, 726, 140, 729, 147, 734);
  bezierVertex(153, 736, 155, 736, 161, 736);
  bezierVertex(154, 603, 147, 495, 140, 379);
  bezierVertex(142, 366, 145, 337, 145, 379);
  bezierVertex(150, 307, 157, 284, 161, 275);
  bezierVertex(176, 218, 179, 209, 178, 203);
  bezierVertex(175, 192, 174, 172, 180, 150);
  bezierVertex(181, 133, 182, 118, 183, 102);
  bezierVertex(182, 105, 181, 108, 180, 114);
  bezierVertex(180, 121, 179, 132, 172, 152);
  bezierVertex(173, 148, 168, 164, 170, 181);
  bezierVertex(172, 191, 173, 206, 169, 219);
  bezierVertex(169, 223, 164, 236, 163, 247);
  bezierVertex(159, 262, 156, 275, 153, 281);
  bezierVertex(145, 297, 141, 312, 137, 333);
  bezierVertex(135, 249, 131, 138, 124, 35);
  bezierVertex(127, 21, 128, 10, 127, -5);
  bezierVertex(126, -2, 126, 9, 121, 26);
  bezierVertex(121, 14, 122, 4, 120, 0);
  bezierVertex(105, 0, 80, 0, 61, 0);
  endShape();
  
  beginShape();
  vertex(141, 394);
  bezierVertex(145, 372, 150, 365, 147, 342);
  bezierVertex(144, 355, 142, 356, 139, 355);
  bezierVertex(139, 362, 138, 378, 134, 388);
  endShape();
  
  beginShape();
  vertex(149, 316);
  bezierVertex(162, 306, 169, 294, 175, 279);
  bezierVertex(170, 285, 165, 296, 150, 309);
  endShape();
  
  beginShape();
  vertex(165, 242);
  bezierVertex(162, 238, 162, 233, 162, 230);
  bezierVertex(160, 227, 159, 219, 160, 198);
  bezierVertex(154, 226, 157, 241, 161, 258);
  endShape();
  
  beginShape();
  vertex(73, 105);
  bezierVertex(69, 101, 65, 84, 64, 80);
  bezierVertex(63, 65, 60, 44, 46, 16);
  bezierVertex(45, 12, 44, 5, 42, 2);
  bezierVertex(45, 15, 50, 35, 59, 68);
  bezierVertex(64, 90, 67, 106, 72, 120);
  endShape();
  
  beginShape();
  vertex(94, 519);
  bezierVertex(91, 514, 88, 501, 86, 497);
  bezierVertex(80, 480, 76, 463, 76, 445);
  bezierVertex(76, 440, 74, 433, 72, 429);
  bezierVertex(69, 417, 63, 391, 61, 362);
  bezierVertex(60, 381, 62, 401, 68, 426);
  bezierVertex(68, 426, 72, 437, 71, 444);
  bezierVertex(73, 462, 75, 478, 83, 500);
  endShape();
  
  stroke(#133848);
  strokeWeight(3);
  bezier(77, 476, 70, 460, 64, 450, 56, 441);
  strokeWeight(2);
  bezier(55, 441, 57, 439, 56, 430, 55, 421);
  
  
  fill(#0b232d);
  noStroke();
  beginShape();
  vertex(227, 713);
  bezierVertex(226, 672, 228, 637, 230, 603);
  bezierVertex(231, 432, 227, 222, 223, 0);
  bezierVertex(243, 0, 260, 0, 277, 0);
  bezierVertex(278, 106, 284, 293, 283, 565);
  bezierVertex(282, 607, 279, 650, 276, 723);
  endShape();
  
  beginShape();
  vertex(278, 119);
  bezierVertex(285, 114, 290, 104, 292, 97);
  bezierVertex(292, 93, 292, 68, 297, 50);
  bezierVertex(299, 47, 301, 40, 300, 33);
  bezierVertex(298, 26, 298, 12, 300, -2);
  bezierVertex(296, 5, 294, 12, 294, 29);
  bezierVertex(294, 32, 294, 40, 291, 50);
  bezierVertex(289, 58, 288, 74, 287, 90);
  bezierVertex(286, 92, 283, 101, 279, 103);
  endShape();
  
  beginShape();
  vertex(228, 210);
  bezierVertex(220, 188, 214, 164, 213, 133);
  bezierVertex(212, 140, 212, 154, 212, 174);
  bezierVertex(214, 186, 219, 205, 229, 229);
  endShape();
  
  beginShape();
  vertex(282, 430);
  bezierVertex(290, 413, 292, 398, 294, 372);
  bezierVertex(295, 356, 297, 340, 299, 331);
  bezierVertex(300, 330, 301, 322, 303, 314);
  bezierVertex(304, 323, 302, 333, 300, 343);
  bezierVertex(298, 348, 297, 361, 298, 375);
  bezierVertex(299, 387, 297, 414, 283, 445);
  endShape();
  
  fill(#fcfafb);
  beginShape();
  vertex(203, 717);
  bezierVertex(214, 709, 226, 706, 234, 710);
  bezierVertex(238, 712, 245, 715, 252, 714);
  bezierVertex(262, 712, 267, 717, 280, 723);
  bezierVertex(277, 726, 274, 736, 272, 736);
  endShape();
  
  
  fill(#133848);
  beginShape();
  vertex(965, 707);
  bezierVertex(968, 516, 971, 396, 973, 307);
  bezierVertex(974, 261, 971, 177, 970, 99);
  bezierVertex(970, 62, 968, 29, 968, 0);
  bezierVertex(984, 0, 1001, 0, 1026, 0);
  bezierVertex(1027, 86, 1027, 263, 1027, 354);
  bezierVertex(1026, 395, 1025, 425, 1024, 470);
  bezierVertex(1024, 516, 1026, 600, 1029, 690);
  endShape();
  
  beginShape();
  vertex(980, 304);
  bezierVertex(964, 259, 950, 218, 939, 185);
  bezierVertex(938, 169, 934, 151, 928, 139);
  bezierVertex(925, 136, 922, 123, 926, 108);
  bezierVertex(928, 102, 923, 81, 921, 60);
  bezierVertex(919, 43, 916, 29, 916, 14);
  bezierVertex(920, 24, 921, 34, 922, 45);
  bezierVertex(922, 52, 926, 62, 930, 71);
  bezierVertex(932, 72, 935, 85, 933, 104);
  bezierVertex(931, 111, 931, 127, 934, 140);
  bezierVertex(936, 146, 945, 164, 946, 185);
  bezierVertex(947, 193, 956, 214, 965, 237);
  bezierVertex(968, 242, 970, 247, 979, 252);
  endShape();
  
  beginShape();
  vertex(946, 182);
  bezierVertex(950, 162, 953, 142, 943, 116);
  bezierVertex(946, 139, 945, 151, 940, 164);
  endShape();
  
  beginShape();
  vertex(1022, 485);
  bezierVertex(1030, 462, 1035, 440, 1040, 426);
  bezierVertex(1041, 417, 1040, 401, 1041, 384);
  bezierVertex(1038, 387, 1039, 400, 1036, 414);
  bezierVertex(1037, 422, 1029, 441, 1024, 459);
  endShape();
  
  fill(#fcfafb);
  beginShape();
  vertex(896, 746);
  bezierVertex(924, 726, 933, 717, 947, 713);
  bezierVertex(956, 714, 960, 712, 963, 706);
  bezierVertex(963, 697, 969, 686, 984, 687);
  bezierVertex(989, 687, 995, 693, 1001, 684);
  bezierVertex(1004, 679, 1015, 673, 1029, 676);
  bezierVertex(1039, 682, 1036, 692, 1068, 704);
  bezierVertex(1030, 750, 954, 760, 896, 746);
  endShape();
  
  fill(#0c222f);
  beginShape();
  vertex(1107, 708);
  bezierVertex(1101, 630, 1093, 516, 1091, 398);
  bezierVertex(1088, 312, 1088, 231, 1090, 132);
  bezierVertex(1090, 85, 1091, 34, 1090, 0);
  bezierVertex(1103, 0, 1117, 0, 1141, 0);
  bezierVertex(1146, 120, 1149, 300, 1152, 473);
  bezierVertex(1151, 515, 1155, 587, 1164, 698);
  endShape();
  
  beginShape();
  vertex(1092, 381);
  bezierVertex(1082, 360, 1079, 337, 1077, 314);
  bezierVertex(1075, 298, 1070, 281, 1067, 260);
  bezierVertex(1065, 269, 1069, 283, 1071, 298);
  bezierVertex(1074, 311, 1074, 326, 1074, 344);
  bezierVertex(1076, 367, 1081, 385, 1092, 406);
  endShape();
  
  beginShape();
  vertex(1092, 144);
  bezierVertex(1078, 104, 1069, 79, 1060, 50);
  bezierVertex(1060, 48, 1053, 36, 1053, 22);
  bezierVertex(1055, 14, 1058, 7, 1054, -2);
  bezierVertex(1060, 1, 1059, 9, 1058, 20);
  bezierVertex(1058, 22, 1059, 29, 1060, 31);
  bezierVertex(1061, 32, 1066, 49, 1074, 74);
  bezierVertex(1074, 73, 1082, 94, 1092, 109);
  endShape();
  
  beginShape();
  vertex(1145, 158);
  bezierVertex(1157, 127, 1168, 100, 1161, 52);
  bezierVertex(1161, 86, 1154, 117, 1144, 137);
  endShape();
  
  stroke(#0c222f);
  strokeWeight(2.5);
  noFill();
  bezier(1161, 102, 1173, 89, 1178, 74, 1176, 58);
  
  stroke(#0c222f);
  strokeWeight(3);
  noFill();
  bezier(1068, 63, 1065, 48, 1068, 37, 1076, 29);
  bezier(1076, 29, 1070, 16, 1070, 2, 1071, 0);
  
  fill(#fcfafb);
  noStroke();
  beginShape();
  vertex(1102, 713);
  bezierVertex(1118, 696, 1128, 695, 1143, 700);
  bezierVertex(1153, 702, 1160, 705, 1165, 704);
  bezierVertex(1162, 722, 1124, 729, 1108, 706);
  endShape();
  
  
  fill(#133848);
  beginShape();
  vertex(1186, 683);
  bezierVertex(1205, 497, 1220, 347, 1226, 268);
  bezierVertex(1232, 147, 1235, 147, 1240, 94);
  bezierVertex(1242, 58, 1247, 23, 1249, 0);
  bezierVertex(1249, 0, 1250, 0, 1252, 0);
  bezierVertex(1252, 254, 1252, 450, 1252, 676);
  endShape();
  
  beginShape();
  vertex(1225, 310);
  bezierVertex(1222, 273, 1217, 237, 1208, 209);
  bezierVertex(1207, 207, 1204, 194, 1204, 182);
  bezierVertex(1204, 173, 1201, 162, 1196, 151);
  bezierVertex(1193, 142, 1194, 130, 1198, 116);
  bezierVertex(1199, 102, 1200, 93, 1196, 72);
  bezierVertex(1193, 58, 1193, 46, 1192, 34);
  bezierVertex(1196, 43, 1196, 58, 1200, 72);
  bezierVertex(1204, 82, 1208, 97, 1205, 113);
  bezierVertex(1202, 126, 1198, 140, 1202, 154);
  bezierVertex(1202, 155, 1208, 175, 1210, 192);
  bezierVertex(1211, 197, 1217, 216, 1224, 231);
  bezierVertex(1227, 233, 1229, 251, 1235, 270);
  endShape();
  
  beginShape();
  vertex(1209, 193);
  bezierVertex(1214, 177, 1217, 160, 1215, 134);
  bezierVertex(1214, 151, 1211, 165, 1206, 173);
  endShape();
  
  fill(#fcfafb);
  beginShape();
  vertex(1181, 682);
  bezierVertex(1193, 670, 1200, 676, 1207, 678);
  bezierVertex(1208, 678, 1214, 679, 1219, 676);
  bezierVertex(1221, 675, 1231, 668, 1240, 673);
  bezierVertex(1247, 674, 1250, 674, 1253, 674);
  bezierVertex(1249, 686, 1210, 694, 1181, 682);
  endShape();
  
  // Увеличиваем расстояние на основе скорости
  distance += 1; // Увеличиваем на скорость движения 
  
  // Отображение расстояния
  textSize(32);
  fill(255);
  text("Расстояние: " + distance + " ", 10, 40); // Отображаем расстояние

  
  
  
  // Движение персонажа в зависимости от выбранного персонажа
  if (selectedCharacter == 0) {
    updateSnoopy(); // Логика для сноубордиста
  } else if (selectedCharacter == 1) {
    updateSkier(); // Логика для лыжника
  }
  
}


  void updateSnoopy(){
   
  // Обновляем положение бревен и снежков
  updateObstacles();

  // Вызов функции проверки столкновений
  checkCollision();
    
    
    // Движение снупи
  if (jumping) {
    snoopyY -= velocityY; // Поднимаем снупи (уменьшает вертикальную позицию Снупи)   velocityY — это скорость, с которой Снупи поднимается
    velocityY -= gravity; // Применяем гравитацию (постепенно уменьшает скорость подъема Снупи)
    if (snoopyY >= height - snoopyHeight - 30) { // Если снупи на земле
      snoopyY = height - snoopyHeight - 30; // Устанавливаем его на землю
      jumping = false; // Завершаем прыжок
      velocityY = 0; // Сбрасываем скорость
      jumpCount = 0; // Сбрасываем счётчик прыжков
    }
  } else {
    // Если снупи не прыгает, он на земле
    snoopyY = height - snoopyHeight - 30; // Устанавливаем его на землю
  }
  
  // Рисуем снупи
  if (keyPressed && keyCode == CONTROL) {
    image(snoopyCtrlImage, 50, snoopyY + 70, snoopyCtrlWidth, snoopyCtrlHeight); // Изображение при нажатии Ctrl
     
    if (isSoundOn) {
      if (!ctrlSound.isPlaying()) {   // Если звук прыжка (ctrlSound) не воспроизводится, то он перематывается в начало и воспроизводится
      ctrlSound.rewind(); // Перематываем звук в начало
      ctrlSound.play(); // Проигрываем звук прыжка
    }  
    }
      
  } else if (jumping) {
    image(snoopyJumpImage, 50, snoopyY, snoopyJumpWidth, snoopyJumpHeight); // Изображение в прыжке
  } else {
    image(snoopyImage, 50, snoopyY, snoopyWidth, snoopyHeight); // Обычное изображение
  }
}

  

// Обновляет положение бревен и снежков
void updateObstacles() {
  logX -= logSpeed; // Двигаем препятствие влево
  if (logX < -log1Width) { // Если препятствие вышло за экран
    logX = width; // Сбрасываем его позицию
    
    // Случайное появление бревна или снежка
    float rand = random(1);
    if (rand < 0.6) {
      showLog = random(1) > 0.5; // Случайно выбираем, какое бревно показывать
    } else {
      if (distance > 1000) {
                isSnowballActive = true; // Активируем снежки
      
      // Ограничиваем частоту появления снежков
      int currentTime = millis(); // Получаем текущее время в миллисекундах с момента запуска программы
      if (currentTime - lastSnowballTime >= minSnowballInterval) {  // Проверяем, прошло ли достаточно времени с момента последнего появления снежка
        lastSnowballTime = currentTime;   // Обновляем время последнего появления снежка
        snowballX = width; // Начинаем с правой стороны экрана
        snowballY = random(500, 800); // Случайная высота снежка
      }
      }
    }
  }
  
  // Рисуем бревно в зависимости от состояния
  if (showLog) {
    image(log1Image, logX, height - log1Height - 30, log1Width, log1Height); // Рисуем первое бревно
  } else {
    image(log2Image, logX, height - log2Height - 30, log2Width, log2Height); // Рисуем второе бревно
  }
  
  // Обрабатываем снежок
  if (isSnowballActive) {
    snowballX -= snowballSpeed; // Двигаем снежок влево

    // Нарисовать снежок
    image(snowballImage, snowballX, snowballY, snowballWidth, snowballHeight);

    // Сбросить позицию снежка, если он выходит за пределы экрана
    if (snowballX < -snowballWidth) {
      isSnowballActive = false; // Деактивировать снежок
    }
  }
}

// Проверяет столкновения
void checkCollision() {
    int snoopyLeft = 50; // Левая граница снупи
    int snoopyRight;
    int snoopyTop;
    int snoopyBottom;

    // Определяем границы снупи в зависимости от состояния
    if (jumping) {
        snoopyRight = snoopyLeft + snoopyJumpWidth;
        snoopyTop = snoopyY; // Верхняя граница прыжка
        snoopyBottom = snoopyTop + snoopyJumpHeight; // Нижняя граница прыжка
    } else {
        if (keyPressed && keyCode == CONTROL) {
            snoopyRight = snoopyLeft + snoopyCtrlWidth;
            snoopyTop = snoopyY + (snoopyHeight - snoopyCtrlHeight);
            snoopyBottom = snoopyTop + snoopyCtrlHeight; // Нижняя граница контроля
        } else {
            snoopyRight = snoopyLeft + snoopyWidth;
            snoopyTop = snoopyY; // Верхняя граница обычного состояния
            snoopyBottom = snoopyTop + snoopyHeight; // Нижняя граница обычного состояния
        }
    }

    // Границы снежка
    int snowballCenterX = (int)(snowballX + snowballWidth / 2); // Центр снежка по горизонтали
    int snowballCenterY = (int)(snowballY + snowballHeight / 2); // Центр снежка по вертикали
    int realSnowballHalfWidth = 20; // Полуширина реального снежка
    int realSnowballHalfHeight = 31; // Полувысота реального снежка

    int snowballLeft = snowballCenterX - realSnowballHalfWidth; // Левая граница снежка
    int snowballRight = snowballCenterX + realSnowballHalfWidth; // Правая граница снежка
    int snowballTop = snowballCenterY - realSnowballHalfHeight; // Верхняя граница снежка
    int snowballBottom = snowballCenterY + realSnowballHalfHeight; // Нижняя граница снежка

    // Проверка на столкновение со снежком
    if (isSnowballActive && snoopyRight > snowballLeft && snoopyLeft < snowballRight && snoopyBottom > snowballTop && snoopyTop < snowballBottom) {
        
       
       
       if (isSoundOn) {
          if (!collisionSnowballSound.isPlaying()) {
            collisionSnowballSound.rewind(); // Перематываем звук в начало
            collisionSnowballSound.play(); // Проигрываем звук прыжка
          }  
       }
       
      
        println("Game Over!"); // Сообщение о столкновении со снежком
        player.pause();
        isGameOver = true; // Устанавливаем флаг окончания игры
        currentState = 2; // Меняем состояние на экран проигрыша
        delay(3000); // Ждем 5 секунд
        return; // Выходим из функции
    }

    // Границы бревна
    int logLeft = logX;
    int logRight = logLeft + (showLog ? log1Width : log2Width);  // Если showLog истинно, используется ширина первого бревна; если ложно, используется ширина второго бревна
    int logBottom = height - (showLog ? log1Height : log2Height) - 30; // Учитываем отступ

    // Проверка на столкновение с бревном
    if (snoopyRight > logLeft && snoopyLeft < logRight && snoopyBottom >= logBottom && snoopyTop <= logBottom + 30) {
        
       
       
       if (isSoundOn) {
          if (!collisionLogSound.isPlaying()) {
            collisionLogSound.rewind(); // Перематываем звук в начало
            collisionLogSound.play(); // Проигрываем звук прыжка
          }  
       }
        
        println("Game Over!"); // Сообщение о столкновении
        player.pause();
        isGameOver = true; // Устанавливаем флаг окончания игры
        currentState = 2; // Меняем состояние на экран проигрыша
        delay(3000); // Ждем 5 секунд
        return; // Выходим из функции    

    }
}





void updateSkier() {
  
  // Обновляем положение бревен и снежков
  updateObstacles2();

  // Вызов функции проверки столкновений
  checkCollision2();
    
    
    // Движение снупи
  if (jumping) {
    skierY -= velocityY; // Поднимаем снупи
    velocityY -= gravity; // Применяем гравитацию
    if (skierY >= height - skierHeight - 30) { // Если снупи на земле
      skierY = height - skierHeight - 30; // Устанавливаем его на землю
      jumping = false; // Завершаем прыжок
      velocityY = 0; // Сбрасываем скорость
      jumpCount = 0; // Сбрасываем счётчик прыжков
    }
  } else {
    // Если снупи не прыгает, он на земле
    skierY = height - skierHeight - 30; // Устанавливаем его на землю
  }
  
  // Рисуем снупи
  if (keyPressed && keyCode == CONTROL) {
    image(skierCtrlImage, 50, skierY + 20, skierCtrlWidth, skierCtrlHeight); // Изображение при нажатии Ctrl
     
    if (isSoundOn) {
      if (!ctrlSound.isPlaying()) {
      ctrlSound.rewind(); // Перематываем звук в начало
      ctrlSound.play(); // Проигрываем звук прыжка
    }
    }
      
  } else if (jumping) {
    image(skierJumpImage, 50, skierY, skierJumpWidth, skierJumpHeight); // Изображение в прыжке
  } else {
    image(skierImage, 50, skierY, skierWidth, skierHeight); // Обычное изображение
  }
}


// Обновляет положение бревен и снежков
void updateObstacles2() {
  logX -= logSpeed; // Двигаем препятствие влево
  if (logX < -log1Width) { // Если препятствие вышло за экран
    logX = width; // Сбрасываем его позицию
    
    // Случайное появление бревна или снежка
    float rand = random(1);
    if (rand < 0.6) {
      showLog = random(1) > 0.5; // Случайно выбираем, какое бревно показывать
    } else {
      if (distance > 1000) {
                isSnowballActive = true; // Активируем снежки
      
      // Ограничиваем частоту появления снежков
      int currentTime = millis();
      if (currentTime - lastSnowballTime >= minSnowballInterval) {
        lastSnowballTime = currentTime;
        snowballX = width; // Начинаем с правой стороны экрана
        // Генерация случайной высоты снежка из двух диапазонов
        float randRange = random(1); // Генерируем случайное число от 0 до 1
        if (randRange < 0.8) {
          snowballY = random(500, 720); // Случайная высота снежка в диапазоне от 500 до 600
        } else {
          snowballY = random(830, 850); // Случайная высота снежка в диапазоне от 700 до 800
    }
      }
      }
    }
  }
  
  // Рисуем бревно в зависимости от состояния
  if (showLog) {
    image(log1Image, logX, height - log1Height - 30, log1Width, log1Height); // Рисуем первое бревно
  } else {
    image(log2Image, logX, height - log2Height - 30, log2Width, log2Height); // Рисуем второе бревно
  }
  
  // Обрабатываем снежок
  if (isSnowballActive) {
    snowballX -= snowballSpeed; // Двигаем снежок влево

    // Нарисовать снежок
    image(snowballImage, snowballX, snowballY, snowballWidth, snowballHeight);

    // Сбросить позицию снежка, если он выходит за пределы экрана
    if (snowballX < -snowballWidth) {
      isSnowballActive = false; // Деактивировать снежок
    }
  }
}



// Проверяет столкновения
void checkCollision2() {
    int skierLeft = 50; // Левая граница снупи
    int skierRight;
    int skierTop;
    int skierBottom;

    // Определяем границы снупи в зависимости от состояния
    if (jumping) {
        skierRight = skierLeft + skierJumpWidth;
        skierTop = skierY; // Верхняя граница прыжка
        skierBottom = skierTop + skierJumpHeight; // Нижняя граница прыжка
    } else {
        if (keyPressed && keyCode == CONTROL) {
            skierRight = skierLeft + skierCtrlWidth;
            skierTop = skierY + (skierHeight - skierCtrlHeight);
            skierBottom = skierTop + skierCtrlHeight; // Нижняя граница контроля
        } else {
            skierRight = skierLeft + skierWidth;
            skierTop = skierY; // Верхняя граница обычного состояния
            skierBottom = skierTop + skierHeight; // Нижняя граница обычного состояния
        }
    }

    // Границы снежка
    int snowballCenterX = (int)(snowballX + snowballWidth / 2); // Центр снежка по горизонтали
    int snowballCenterY = (int)(snowballY + snowballHeight / 2); // Центр снежка по вертикали
    int realSnowballHalfWidth = 20; // Полуширина реального снежка
    int realSnowballHalfHeight = 31; // Полувысота реального снежка

    int snowballLeft = snowballCenterX - realSnowballHalfWidth; // Левая граница снежка
    int snowballRight = snowballCenterX + realSnowballHalfWidth; // Правая граница снежка
    int snowballTop = snowballCenterY - realSnowballHalfHeight; // Верхняя граница снежка
    int snowballBottom = snowballCenterY + realSnowballHalfHeight; // Нижняя граница снежка

    // Проверка на столкновение со снежком
    if (isSnowballActive && skierRight > snowballLeft && skierLeft < snowballRight && skierBottom > snowballTop && skierTop < snowballBottom) {
        
       
       if (isSoundOn) {
          if (!collisionSnowballSound.isPlaying()) {
            collisionSnowballSound.rewind(); // Перематываем звук в начало
            collisionSnowballSound.play(); // Проигрываем звук прыжка
          }  
       }
      
        println("Game Over!"); // Сообщение о столкновении со снежком
        player.pause();
        isGameOver = true; // Устанавливаем флаг окончания игры
        currentState = 2; // Меняем состояние на экран проигрыша
        delay(3000); // Ждем 5 секунд
        return; // Выходим из функции
    }

    // Границы бревна
    int logLeft = logX;
    int logRight = logLeft + (showLog ? log1Width : log2Width);
    int logBottom = height - (showLog ? log1Height : log2Height) - 30; // Учитываем отступ

    // Проверка на столкновение с бревном
    if (skierRight > logLeft && skierLeft < logRight && skierBottom >= logBottom && skierTop <= logBottom + 30) {
        
       
       if (isSoundOn) {
          if (!collisionLogSound.isPlaying()) {
            collisionLogSound.rewind(); // Перематываем звук в начало
            collisionLogSound.play(); // Проигрываем звук прыжка
          }  
       }
        
        println("Game Over!"); // Сообщение о столкновении
        player.pause();
        isGameOver = true; // Устанавливаем флаг окончания игры
        currentState = 2; // Меняем состояние на экран проигрыша
        delay(3000); // Ждем 5 секунд
        return; // Выходим из функции
    }
}



void keyPressed() {
  if (key == ' ' && (!jumping || (jumping && jumpCount < 2))) { // Прыжок при нажатии пробела
    jumping = true; // Начинаем прыжок
    velocityY = jumpSpeed; // Устанавливаем начальную скорость прыжка
    jumpCount++; // Увеличиваем счётчик прыжков
    if (isSoundOn) {if (!jumpSound.isPlaying()) {  //Проверяет, не воспроизводится ли звук прыжка в данный момент
            jumpSound.rewind(); // Перематываем звук в начало
            jumpSound.play(); // Проигрываем звук прыжка
        }
    }
  }
}



boolean isMouseOver(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

void mousePressed() {
  // Проверка нажатия на кнопки
        if (currentState == 0) { // Проверяем, что мы находимся в главном меню
            // Здесь мы просто переключаем состояние, но не воспроизводим звук
            if (isMouseOver(856, 788, buttonWidth2, buttonHeight2)) {
                isSoundOn = !isSoundOn;
                if (isSoundOn) { // Проверяем, включен ли звук
                clickSound.rewind(); // Сбрасываем позицию звука
                clickSound.play(); // Воспроизводим звук нажатия
                }
                // Не добавляем логику для остановки/включения звуков
            }
            
            if (isMouseOver(995, 788, buttonWidth2, buttonHeight2)) {
                isMusicOn = !isMusicOn; // Переключаем состояние музыки
                // Не добавляем логику для остановки/включения музыки
                if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                } 
            }
        } else if (currentState == 1) { // Проверяем, что мы находимся в игровом состоянии
            if (isMouseOver(856, 788, buttonWidth2, buttonHeight2)) {
                isSoundOn = !isSoundOn; // Переключаем состояние звука
                // Здесь можно добавить логику для остановки/включения звуков
                if (isSoundOn) {
                    // Включаем звуки в игре
                    // Например, можно перезапустить звуки, если они были остановлены
                } else {
                    // Останавливаем звуки в игре
                    // Например, можно остановить все звуки
                }
            }
        if (isMouseOver(995, 788, buttonWidth2, buttonHeight2)) {
            isMusicOn = !isMusicOn; // Переключаем состояние музыки
            if (isMusicOn) {
                player.loop(); // Запускаем музыку, если она включена
            } else {
                player.pause(); // Останавливаем музыку, если она выключена
            }
        }
    }
    
    
    
    
    if (currentState == 0) { // Главное меню
        if (isMouseOver(826, 380, buttonWidth, buttonHeight)) {
            if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
            currentState = 1; // Начинаем новую игру
            resetGame(); // Сброс состояния игры
            if (isMusicOn) {
            player.rewind(); // Останавливаем текущую музыку
            player.loop(); // Запускаем музыку заново
          }
        }
    }
    
    else if (currentState == 2) { // Экран проигрыша
        if (isMouseOver(470, 354, 312, 101)) { // Кнопка "Еще раз"
            if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
            currentState = 1; // Начинаем новую игру
            resetGame(); // Сброс состояния игры
            if (isMusicOn) {
            player.rewind(); // Останавливаем текущую музыку
            player.loop(); // Запускаем музыку заново
          }
        } else if (isMouseOver(470, 495, 312, 101)) { // Кнопка "Главная"
            if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
            currentState = 0; // Возвращаемся в главное меню
            if (isMusicOn) {
            mainSound.rewind(); // Останавливаем текущую музыку
            mainSound.play(); // Запускаем музыку заново
            }
            resetGame(); // Сброс состояния игры при возврате на главный экран
        }
    
    }
    
  
  
  
  
  
  if (currentState == 0) { // Если находимся в главном меню
    if (isMouseOver(826, 380, buttonWidth, buttonHeight)) {
      if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
      currentState = 1; // Переход к игровому экрану
      if (isMusicOn) {
      player.loop(); // Включаем бесконечное воспроизведение музыки
      }
    } else if (isMouseOver(826, 516, buttonWidth, buttonHeight)) {
      if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
      // Переход на экран выбора персонажей
      currentState = 3;
    } else if (isMouseOver(826, 652, buttonWidth, buttonHeight)) {
      if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
      // Переход на страницу с правилами
      currentState = 4;
    }
  }
 
  // Проверка нажатия кнопки "Назад"
  if (currentState == 3 && isMouseOver(40, 40, 50, 50)) {
    if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
    currentState = 0; // Возврат на главный экран
  } else if (currentState == 4 && isMouseOver(40, 40, 50, 50)) {
    if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
    currentState = 0; // Возврат на главный экран
  }
  
  if (currentState == 3) { // Если находимся на экране выбора персонажа
    if (isMouseOver(110, 330, 452, 115)) {
      if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
      selectedCharacter = 1; // Выбор первого персонажа
      //currentState = 1; // Переход к игровому экрану
    } else if (isMouseOver(690, 330, 452, 115)) {
      if (isSoundOn) { 
                clickSound.rewind(); 
                clickSound.play(); 
                }
      selectedCharacter = 0; // Выбор второго персонажа
    }
  }
}

void stop() {
    // Остановка всех аудиоплееров при завершении
    player.close();
    collisionLogSound.close();
    collisionSnowballSound.close();
    jumpSound.close();
    ctrlSound.close();
    minim.stop(); // Остановка Minim
    super.stop(); // Завершение выполнения программы
}

void resetGame() {
    // Сброс всех переменных, связанных с игрой
    distance = 0; // Сброс счета
    isGameOver = false; // Сброс флага окончания игры
    snoopyY = height - snoopyHeight - 30; // Сброс позиции Снупи
    skierY = height - skierHeight - 30;
    logX = width; 
    showLog = true;
    snowballX = width; // Начинаем с правой стороны экрана
    snowballY = 550; 
    
}
