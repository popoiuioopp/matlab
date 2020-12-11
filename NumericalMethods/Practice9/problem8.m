%{
The following grid represents 6 pixels of an image and 
their corresponding colourvalue (one of RGB for example).
                  ________________
                  | 10 | 15 | 30 |
                  ________________
                  | 30 | 35 | 50 |
                  ________________

We zoom in and create more pixels which we need to 
interpolate in order tosmooth out the image.

               | 10 _ _ 15 _ _ _ 30  |
               |  _ _ _  _ _ _ _  _  |
               |  _ _ _  _ _ _ _  _  |
               | 30 _ _ 35 _ _ _  50 |

Use linear interpolation to find the missing values 
(store the values as a matrix containing the colour 
value at each of the coordinate locations).
%}

x = [10 15 30;
     30 35 50];

result = pp9_bilinear(x, [10,10]);
imagesc(result);