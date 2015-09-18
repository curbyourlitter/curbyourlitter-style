// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Fonts //
@sans: 'National Regular';
@sans_bold: 'National Bold';

/*
This style is designed to be easily recolored by adjusting the color
variables below. For predicatable feature relationships,
maintain or invert existing value (light to dark) scale.
*/

// Color palette //
@road:  #ffffff;
@land:  #f5fff5;
@park:  #cbffc5;

// Water color is calculated by sampling the resulting color from
// the soft-light comp-op in the #water layer style above. 
@water: #fcffff;

@fill1: #fff;
@fill2: #dafad2;
@fill3: #fff;
@fill4: #FFF;

@text: #8dc96c;

Map { font-directory: url("fonts/"); background-color: @land; }

// Political boundaries //
#admin[admin_level=2][maritime=0] {
  line-join: round;
  line-color: mix(@fill3,@fill2,50);
  line-width: 1;
  [zoom>=5] { line-width: 1.4; }
  [zoom>=6] { line-width: 1.8; }
  [zoom>=8] { line-width: 2; }
  [zoom>=10] { line-width: 3; }
  [disputed=1] { line-dasharray: 4,4; }
}

#admin[admin_level>2][maritime=0] {
  line-join: round;
  line-color: @fill2;
  line-width: 1;
  line-dasharray: 3,2;
  [zoom>=6] { line-width: 1.5; }
  [zoom>=8] { line-width: 1.8; }
}

// Land Features //
#landuse[class='cemetery'],
#landuse[class='park'],
#landuse_overlay {
  polygon-fill: @park;
  [zoom>=15] { polygon-fill:@park; }
}

#landuse[class='pitch'],
#landuse[class='sand'] { 
  polygon-fill: darken(@land,3);
}

#landuse[class='hospital'],
#landuse[class='industrial'],
#landuse[class='school'] { 
  polygon-fill: darken(@land,3);
}

#building { 
  polygon-fill: darken(@land,3);
  [zoom>=17]{ polygon-fill: darken(@land,5);}
}

#aeroway {
  ['mapnik::geometry_type'=3][type!='apron'] { 
    polygon-fill: mix(@fill2,@land,25);
    [zoom>=16]{ polygon-fill: mix(@fill2,@land,50);}
  }
  ['mapnik::geometry_type'=2] { 
    line-color: mix(@fill2,@land,25);
    line-width: 1;
    [zoom>=13][type='runway'] { line-width: 4; }
    [zoom>=16] {
      [type='runway'] { line-width: 6; }
      line-width: 3;
      line-color: mix(@fill2,@land,50);
    }
  }
}

// Water Features //
#water {
  polygon-fill: @water;
  line-color: @water;
}



#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}
