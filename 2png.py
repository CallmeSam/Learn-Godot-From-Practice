# author: Yang CHEN
#!/usr/bin/python

import os, sys, getopt, glob
from PIL import Image

def get_opt(argv):
    input_dir = ""
    output_dir = ""
    color_str = ""
    color = ()

    try:
        opts, args = getopt.getopt(argv, "hi:o:c:", ["idir=", "odir=", "color="])
    except getopt.GetoptError:
        print("bmp2png.py -i <input_dir> -o <output_dir> -c <color>")
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            print("\n    2png.py -i <input_dir> -o <output_dir> -c <color>\n")
            print("\tConvert image files (.jpg, .png, .bpm) to .png files.\n")
            print("\t-i, --idir: ")
            print("\t\t The source directory in which contains the .bmp files.\n")
            print("\t-o, --odir: ")
            print("\t\t The destination direcotry where the converted files will be saved.\n")
            print("\t-c, --color: ")
            print("\t\t To make the background color or certains colors to be transparent.\n")
            print("\t\t If not specified, only the image will be converted to png\n")
            print("\t\t Available colors: red, green, blue, black, magenta, cyan, yellow\n")
            print("    Example:\n\t bmp2png.py -i ./images -o ./converted -c yellow")
            sys.exit()
        elif opt in ("-i", "--idir"):
            input_dir = arg
        elif opt in ("-o", "--odir"):
            output_dir = arg
        elif opt in ("-c", "--color"):
            color_str = arg
            if color_str.lower() == "red":
                color = (255, 0, 0, 255)
            elif color_str.lower() == "green":
                color = (0, 255, 0, 255)
            elif color_str.lower() == "blue":
                color = (0, 0, 255, 255)
            elif color_str.lower() == "black":
                color = (0, 0, 0, 255)
            elif color_str.lower() == "magenta":
                color = (255, 0, 255, 255)
            elif color_str.lower() == "cyan":
                color = (0, 255, 255, 255)
            elif color_str.lower() == "yellow":
                color = (255, 255, 0, 255)

    return (input_dir, output_dir, color)

def img_process(imgfile, color, out):
    if imgfile:
        img = Image.open(imgfile).convert("RGBA")
        f = os.path.basename(imgfile)

        if color == ():
            img.save(out + "\\" + f + ".png")
        else:
            for i in range(img.size[0]):
                for j in range(img.size[1]):
                    if img.getpixel((i, j)) == color:
                        img.putpixel((i, j), (255, 255, 255, 0))

            img.save(out + "\\" + f + ".png")


def main():
    i, o, c = get_opt(sys.argv[1:])

    idir = os.path.abspath(i)
    odir = os.path.abspath(o)

    hierachy = os.walk(idir)

    file_ext = ["*.jpg", "*.png", "*.bmp",]

    print(hierachy)

    if o == "":
        os.mkdir(i + "_output")

    if not os.path.exists(o):
        print("Creating folder: ", odir)
        os.mkdir(o)

    os.chdir(idir)
    files = [glob.glob(e) for e in file_ext]
    for t in files:
        for infile in t:
            img_process(infile, c, odir)

    for dir, subdirs, files in hierachy:
        for d in subdirs:
            odirt = odir + "\\" + d
            dirt = dir + "\\" + d + "\\"
            # if there are such files
            files = [glob.glob(dirt + e) for e in file_ext]
            for t in files:
                if not os.path.exists(odirt):
                    os.mkdir(odirt)
                    print("Creating folder: ", odirt)

                for infile in t:
                    img_process(infile, c, odirt)

if __name__ == "__main__":
    main()

