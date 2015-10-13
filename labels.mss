// Road labels
#road_label[zoom>=16] { 
  text-placement: line;
  text-placement-type: simple;
  text-align: right;
  text-allow-overlap: false;
  text-transform: uppercase;
  text-face-name: @sans;
  text-name: @name;
  text-size: 8;
  text-wrap-width: 150;
  text-margin: 250;
  text-repeat-distance: 150;
  text-min-path-length: 50;
  text-character-spacing: 2;
  text-fill: @text;
  text-opacity: 0.85;
  [zoom>=17] { text-size: 10; text-margin: 75; text-character-spacing: 3;}
}

// Water labels
#marine_label { 
  text-name: @name;
  text-face-name: @sans;
  text-fill: @text;
  text-size: 12;
  text-halo-fill: @water;
  text-halo-radius: 1;
  text-wrap-before: true;
  text-wrap-width: 90;
  [labelrank=1] {
   text-size: 18;
  }
}

#water_label {
  [zoom<=13],
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @sans;
    text-fill: @text;
    text-size: 12;
    text-halo-fill: @water;
    text-halo-radius: 1;
    text-wrap-width: 60;
    text-wrap-before: true;
    text-avoid-edges: true;
  }
}

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=14],
#waterway_label[type='stream'][zoom>=15] { 
  text-name: @name;
  text-face-name: @sans;
  text-fill: @text;
  text-min-distance: 60;
  text-size: 10;
  text-halo-fill: @water;
  text-halo-radius: 1;
  text-wrap-before: true;
  text-avoid-edges: true;
  text-placement: line;
}

#poi_label[maki='park'][zoom>=16][scalerank<=2] { 
  text-face-name: @sans;
  text-allow-overlap: false;
  text-name: @name;
  text-size: 12;
  text-line-spacing: 1;
  text-min-distance: 50;
  text-wrap-width: 50;
  text-halo-fill: @land;
  text-halo-radius: 1;
  text-fill: @text;
}
