function img = saveandload(imgold)
    pgmWrite(imgold, 'temp.pgm');
    img = pgmRead('temp.pgm');
end