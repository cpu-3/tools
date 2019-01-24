import sys
import lief

if len(sys.argv) < 3:
    print('[usage] {} <ELF file> <output>'.format(sys.argv[0]))

filename = sys.argv[1]
output = sys.argv[2]

binary = lief.parse(filename)

sections = ['.reset.boot', '.text', '.rodata']

with open(output, 'w') as f:
    for name in sections:
        section = binary.get_section(name)
        data = ''.join(map(chr, section.content))
        f.write(data)
