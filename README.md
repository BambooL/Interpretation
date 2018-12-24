# ![](docs/img/logo_sm.png) Visual Analysis for State Changes in RNNs for Program Synthesis

## Install

Please use python 2.7 to install LSTMVis.

Clone the repository:

```bash
git clone https://github.com/HendrikStrobelt/LSTMVis.git; cd LSTMVis
```

Install python (server-side) requirements using [pip](https://pip.pypa.io/en/stable/installing/):

```bash
pip install -r requirements.txt

on OSX 10.11 (El Capitan):
pip install --user -r requirements.txt
```

Process dataset:

```bash
cd model/linux_original
chmod +x run.sh
./run.sh
```

start server:

```bash
cd ../..
python lstm_server.py -dir model/linux_original
```

For the example dataset, use `python lstm_server.py -dir data`

open browser at [http://localhost:8888](http://localhost:8888/client/index.html) - eh voila !


## Credits

This work is folked from LSTMVis. LSTMVis is a collaborative project of Hendrik Strobelt, Sebastian Gehrmann, Bernd Huber, Hanspeter Pfister, and Alexander M. Rush at Harvard SEAS.
