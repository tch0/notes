# -*- coding: utf-8 -*-

from PIL import Image, ImageFilter

# open an image
im = Image.open('nephren.png')
# get image size
w, h = im.size
print('Original image size: %sx%s' % (w, h))
# resize to 50%
im.thumbnail((w//2, h//2))
print('Resize image to: %sx%s' % (w//2, h//2))
# save scaled image
im.save('thumbnail.png', 'png')

# blur an iamge
im = Image.open('nephren.png')
im2 = im.filter(ImageFilter.BLUR)
im2.save('blur.png', 'png')