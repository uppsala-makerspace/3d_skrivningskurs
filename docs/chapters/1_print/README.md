# 1. Att skriva ut

För att skriva ut, behöver du en STL fil av din ritning.
I båda Blender och OpenSCAD kan du exportera din ritning till STL.

I Blender, klicka 'File | Export | Stl (.stl)'
för att exporter din model till en STL fil.

![klicka 'File | Export | Stl (.stl)'](1_blender_export_to_stl.png)

I OpenSCAD, klicka 'File | Export | Export as STL'
för att exporter din model till en STL fil.

![klicka 'File | Export | Export as STL'](1_openscad_export_to_stl.png)

## 1.1. Att ladda en STL fil in PrusaSlicer

Starta programmet PrusaSlicer.

![PrusaSlicer](1_prusaslicer.png)

Klick på 'File | Import | Import STL'.

![Klick på 'File | Import | Import STL'](1_click_file_import_import_stl.png)

Välja en STL fil och klicka på 'Open'.

![Välja en STL fil och klicka på 'Open'](1_select_stl_file.png)

Nu har du laddet en kub i PrusaSlicer. Den ser ut likadant som här:

![Kuben är laddat](1_cube_is_loaded.png)

## 1.2. Att välja en 3D skrivare

I Makerspacet, letar efter en 3D skrivare som är ledigt.
Varje 3D skrivare har ett namm. Till exempel,
den här skrivare här nere heter 'Merkurius'.

![Den här skrivare heter 'Merkurius'](1_merkurius.jpg)

I PrusaSlicer, väljer samma 3D skrivare.

![välja samma 3D skrivare](1_select_printer.png)

## 1.3. Att slica

Klicka på 'Slice now'.

![Klicka på 'Slice now'](1_click_slice_now.png)

Nu är slicingen klart.

![Slicingen är klart](1_slicing_done.png)

## 1.4. Att skriva ut

Hos Uppsala Makerspace har vi två regler kring 3D skrivning:

- Under din första skrivning, måste du kollar på skrivaren hela tiden.
  Målet är att du ser hur en vanligt/lyckande skrivning ser ut
- Under din senerare skrivningar, måste du vara i hörseldistans av skrivaren.
  Målet är att du kan stoppa skrivaren när något gor fel.

Om du förstår reglerna, klicka på 'Send to printer'.

![Klicka på 'Slice now'](1_click_slice_now.png)

Nu har du 'slicat' (vad den än är) din första model.

![Slicingen är färdigt](1_slicing_done.png)

Klick nu på 'Send to print' ('Schick till skrivaren')
i hörnet botten nere:

![Klick på 'Send to print'](1_send_to_printer.png)

Du blir frågat hur skrivaren måste kallas din 3D tryck.
Klicka på 'Upload and print' ('ladda up och skriv ut').

![Klicka på 'Upload and print'](send_gcode_to_printer_host.png)

Nu bör 3D skrivaren sätter sig igång.

Igen, regeln är att, under din första skrivning,
måste du kollar på skrivaren hela tiden.
Målet är att du ser hur en vanligt/lyckande skrivning ser ut.

Så, vad ser du att skrivaren gör först?

Kolla på skärmen av 3D skrivaren.
Hur länge ska din 3D tryck tar?

![Skärm av skrivaren](1_printer_screen.jpg)

På värmebädden (plattan där skriving tar plats på),
på framsida finns en symbol av en fingeravtryck.
Vad tror du att den betyder?

![Värmebädden har symboler av fingeravtryckar](1_heating_bed_front_left.jpg)

Om allt lyckades: grattis, du har skrivit ut din första sak!

![Den utskrivna kuben](1_printed_cube.jpg)
