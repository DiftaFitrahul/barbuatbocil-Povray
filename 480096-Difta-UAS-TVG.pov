// Difta Fitrahul Qihaj
// 21/480096/TK/52975


#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "Woods.inc"
#include "stones.inc"
#include "glass.inc"
#include "metals.inc"
global_settings { assumed_gamma 1.5 }
camera {
  sky <0,0,1>         
  direction <-1,0,0>    
  location  <10,0,8>  
  look_at   <0,0,0>    
  angle 50     
}

light_source {
  <0,0,5>       
  color White*1.5      
}  
  
  
background { color White }  



plane {<0,0,1>,0 texture {T_Wood32}} 

//======================================
//This is code for box   
//====================================== 

difference {
    box {
    <-1.5, 0,   -1>,  
    < 1.5, 1.3,  4.5> 
        
    pigment{
            color <1,0,0>
        }
    translate <0, -0.2, 0>
    rotate x*90
    rotate z*45 
    finish {
      Phong_Glossy
      ambient 0.2
        }  
   }
  
  box {
    <-1.37, 0,   -0.87>,  
    < 1.37, 2,  4.37>
    pigment {
       DMFWood5
      
   }
    translate <0, 0.1, 0>
    rotate x*90
    rotate z*45  
    }
      
    
}  


//====================================== 
//This is code for candy                 
//======================================

union{  

intersection {
   sphere { <0, 0, 0>,0.4 }                

   finish {
      Phong_Glossy
      ambient 0.2
   }
   pigment {
         wood
         color_map {
            [0.0 0.15 color SemiSweetChoc color CoolCopper ]
            [0.15 0.40 color CoolCopper color Clear ]
            [0.80 1.01 color CoolCopper color SemiSweetChoc ]
         }
         scale <3.5, 1, 1>
         translate -50*y
         rotate 1.5*z
      }
   rotate x*0
   translate <2.2, 2.2, 0.5>
}
    cylinder {
    <0, 1, 0>,  
    <1.7, 1.9, -0.5>,     
    0.046          
    open           
    pigment{
        color <1,1,1>
        }
    translate <2.1,1.17,0.55>
  }   

}  
    
    
    

//======================================
//This is code for Watermelon           
//======================================
//First we create texture for watermelon


#declare Watermelon = texture {
    finish { 
        ambient 0.3 
        }
    pigment {
        onion  
        scale 1.6
        color_map {
            [0 0.66 color Red color Red ] 
            [0.75 0.8 color Orange color GreenYellow  ]
            
            [0.9 1.0  color Green  color Green  ]
                 
            }
        }
}
  
//Second we create slice for watermelon and implement the texture

#declare Watermelonedge = intersection {
sphere { <0, 0, 0>, 1.35 } 
plane { y, 0 rotate 45*x } 
plane { y, 0 rotate -45*x } 

texture { Watermelon }

}
//Lastly we create watermelon with a seed of the watermelon

union{

     object { Watermelonedge 

     rotate 90*x 
     rotate 40*z
    
     }
     sphere{
     
     <0,0,0> 0.06
     pigment{
        color Black
     }
     
     translate <0.5,-0.05,-0.4>
     }
     
     sphere{
     
     <0,0,0> 0.1
     pigment{
        color Black
     }
     
     translate <0,-0.5,-0.5>
     }
     
     sphere{
     
     <0,0,0> 0.1
     pigment{
        color Black
     }
     
     translate <0.25,-0.3,-0.5>
     } 
     
     sphere{
     
     <0,0,0> 0.1
     pigment{
        color Black
     }
     
     translate <-0.37,-0.7,-0.4>
     }
     
     sphere{
     
     <0,0,0> 0.1
     pigment{
        color Black
     }
     
     translate <0.7,0.34,-0.3>
     }
     
     sphere{
     
     <0,0,0> 0.1
     pigment{
        color Black
     }
     
     translate <0.45,0.64,-0.28>
     }    
     
     sphere{
     
     <0,0,0> 0.1
     pigment{
        color Black
     }
     
     translate <0.05,0.51,-0.45>
     }    
     
      sphere{
     
     <0,0,0> 0.1
     pigment{
        color Black
     }
     
     translate <-0.4,0.17,-0.48>
     }  
     
     sphere{
     
     <0,0,0> 0.1
     pigment{
        color Black
     }
     
     translate <-0.6,-0.2,-0.32>
     }         

 rotate z*10
 rotate x*0
 translate <0, 3.5, 1.1> 
}   




//======================================
//This is code for Donut           
//======================================
//First we create texture for first layer of donuts


#declare lapisanDasarDonut = texture {
      pigment { 
        agate  
        turbulence 1.6
        frequency 5
        color_map {
          [0.0 Tan]
          [0.85 Tan]
          [0.95 SemiSweetChoc]
          [1.0 SemiSweetChoc]
        }  
      }
      finish { 
      ambient 0.1}
    } 
//Second we create texture for Chocolate layer of donuts

#declare lapisanCoklatDonat = texture {
          pigment { 
            gradient y
            color_map {
              [0.0 BakersChoc]
              [1.0 Black ]
            }
          }
          finish { phong .75 phong_size 20}
          normal { waves 1 frequency 3 } 
        }
    
//Lastly we create texture for mix layer of donuts
    
#declare lapisanCampuran = texture {
      wood
      frequency 0.1
      turbulence 0.1
      texture_map {
         [0.5 lapisanDasarDonut]
         [1.0 lapisanCoklatDonat]
       }  
      scale 15
      rotate z*90
}

//we create a donuts with mix layer

torus {
    0.8
    0.4 
     texture { 
        lapisanCampuran
         } 
    rotate x*-90
    translate <0, -0.3, 0.5>
  }  

//we create a donuts with Chocolate layer      

torus {
    0.8
    0.4 
     texture { 
        lapisanCoklatDonat 
        } 
    rotate x*-90
    translate <2, -2.1, 0.5>
  } 
  
  
   
  
//======================================
//This is code for Glass           
//======================================
//First we create material for glass


#declare textureGlass=    
material {
  texture {
    pigment {
        rgbt <1,1,1,0.6>
        }
    finish {
      ambient 0.0
      diffuse 0.05
      specular 0.6
      roughness 0.005
      reflection {
        0.1, 1.0
        fresnel on
      }
      conserve_energy
    }
  }
  interior {
    ior 1.5
    fade_color <0.5,0.8,0.4>
  }
}
  

//Then we create glass
union{ 

    
   //this is for the container of water 

   cone {
    <0, 1, 0>, 0    
    <0, 2, 0>, 1.0    
    open             
   material { 
    textureGlass 
    }

  photons {  
    target 1.0
    refraction on
    reflection on
  }
    rotate x*90
    rotate y*0
    translate <0,0,2.3>
    
  }
  
  //this is for water 
  cone {
    <0, 1, 0>, 0    
    <0, 1.8, 0>, 0.79    
    open             
   texture { 
       Water
       pigment{
           rgbt<1,0.1,0.1,0.4>
            }
    }

    rotate x*90
    rotate y*0
    translate <0,0,2.3>
    
  }
  
  //this is for the pillar of the glass 

  cylinder { 
  <0,0,0>,
  <0,1.5,0>, 
  0.07       
  material { 
    textureGlass 
    }
  photons {  
    target 1.0
    refraction on
    reflection on
  }

  scale <1,1,1> 
  rotate x * 90
  translate<0,0,2>
  } 
       

  //this is for the base of the glass 
  
  cylinder { 
  <0,0,0>,
  <0,0.07,0>, 
  0.6 

  material { 
    textureGlass 
    }
  photons {  
    target 1.0
    refraction on
    reflection on
  }

  scale <1,1,1> 
  rotate x * 90
  translate<0,0,2>
   } 

  translate <-2,-3.2,-1.8>
}
 
 
                