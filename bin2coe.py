import sys
import struct
top = 'memory_initialization_radix=16;\nmemory_initialization_vector='
def main():
    if len(sys.argv) == 1:
        print('invalid args')
        return

    with open(sys.argv[1], 'rb') as f:
        bs = f.read()

    print('filesize is ', len(bs))
    if len(bs) % 4 != 0:
        print('invalid file size')
        return

    with open(sys.argv[1] + '.coe', 'w') as f:
        f.write(top)
        for i in range(len(bs) // 4):
            l = 4 * i
            u = 4 * (i + 1)
            s = struct.unpack('>I', bs[l:u])[0]
            f.write(hex(s)[2:])
            f.write(';\n')


if __name__ == '__main__':
    main()
