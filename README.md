NESXGridLayoutView
=================
Eazy way to get a nice pic with round corner,shadow,border,support autolayout.

## Install

Just drag the NESXGridLayoutView folder to you project.

## How to use

* implement the NESXGridLayoutViewDatasource protocol,there're three required method.

````objective-c
-(UIView *)viewAtIndex:(NSUInteger)index;

-(NSUInteger)columnsForRow;

-(NSUInteger)numberOfViews;
````

if you want to use autolayout for the view,you can chose the class method with frame param.

````objective-c
+(NESXGridLayoutView *)viewWithFrame:(CGRect)frame;
````

otherwise

````objective-c
+(NESXGridLayoutView *)view;
````

you can see more details in the demo project.

## Author

iOS Developer with a few year experience, welcome to my personal site and see more:

http://www.nestor.me

## License

The MIT License (MIT)

Copyright (c) 2013 Oskar Groth

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
