import sys
import lief

if len(sys.argv) < 3:
    print('[usage] {} <ELF file> <output>'.format(sys.argv[0]))

filename = sys.argv[1]
output = sys.argv[2]

binary = lief.parse(filename)

sections = ['.reset.boot', '.text', '.rodata']

pad = 0
num_wrote = 0
with open(output, 'wb') as f:
    for name in sections:
        section = binary.get_section(name)
        data = bytes(section.content)

        zero_pad_size = section.virtual_address - num_wrote
        f.write(b'\x00' * zero_pad_size)
        num_wrote += zero_pad_size
        f.write(data)
        pad = (pad + section.size) % 4
        num_wrote += section.size

    f.write(b'\x00' * (4 - pad))
