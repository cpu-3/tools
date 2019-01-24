import sys
filename = 'mandelbrot'
x = 400
y = 400

with open(filename) as f:
    cnt = 0
    for line in f.read():
        if line[0] == '0':
            sys.stdout.write(' ')
        else:
            sys.stdout.write('▉')
        cnt += 1
        if cnt == 400:
            cnt = 0
            sys.stdout.write('\n')




