# gallantlab/motion_energy_matlab

![motion energy model](/demo/motionenergymatlab_s.png)
motion_energy_matlab is a software library to calculate motion or static energy features of visual stimuli (movies or images).


## QUICKSTART/USAGE
The main functions accept movie/image stimulus inputs and return the energy feature outputs. To test the code, you can use one of two methods. Either (1) use the sample data we have provided ([click here to download](https://www.dropbox.com/s/1531dr5u7767wat/nishimoto_2011_val_1min_uint8.mat?dl=0)). You should save the file somewhere on your Matlab path as `'nishimoto_2011_val_1min_uint8.mat'`. Or (2) prepare your own set of movie frames in a 4D array of [X x Y x Color x Time]. For now, the code only supports square images (it may run for rectangular images, but the filters may be stretched and may give unexpected results). If you choose (2), you will need to change a line in `ComputeMotionEnergy.m`


Then run `ComputeMotionEnergy.m` in MATLAB (under `demo/` folder):


```
>> ComputeMotionEnergy;
```


The code allows flexible specifications of filter array parameters, such as the highest spatial frequency, the number of directions of motion, the number of scales of filters, etc. Image pre-processing and post-processing parameters (such as how to handle color channels) can be specified as well. Default values can be specified for all parameters. For example, if you want to load a default parameter set and then only specify the highest spatial and temporal frequency:


```
>> gparams = preprocWavelets_grid_GetMetaParams(2); % load the default parameter set 2 (as in Nishimoto et al., 2011)
>> gparams.sfmax = 24; % the highest frequency is set to 24 cycles/image
>> gparams.tfmax = 6; % the highest temporal frequency is set to 6 cycles/time window
>> [S_gab, gparams] = preprocWavelets_grid(S_lum, gparams); % calculate the energy features of luminance pattern S_lum
```


For more details, please type ‘help [filename]’ (e.g.,):

```
>> help preprocWavelets_grid
```


## REQUIREMENTS
-	MATLAB
-	Image Processing toolbox (for color conversion)



## REFERENCES
The original motion energy model was proposed by Watson and Ahumada (1985) and Adelson and Bergen (1985). The codes were written by Shinji Nishimoto (Nishimoto et al., 2011; Nishimoto and Gallant 2011) and edited and commented by Mark Lescroart.

* Watson AB, Ahumada AJ Jr., [Model of human visual-motion sensing.](https://history.arc.nasa.gov/hist_pdfs/awards/hjaa_1990.pdf) J Opt Soc Am A. 2(2):322-41. (1985)
* Adelson EH, Bergen JR., [Spatiotemporal energy models for the perception of motion.](https://www.osapublishing.org/josaa/abstract.cfm?uri=josaa-2-2-284), J Opt Soc Am A. 2(2):284-99. (1985)
* Nishimoto S, Vu AT, Naselaris T, Benjamini Y, Yu B, Gallant JL., [Reconstructing visual experiences from brain activity evoked by natural movies.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3326357/) Curr Biol. 21(19):1641-6. (2011)
* Nishimoto S, Gallant JL., [A three-dimensional spatiotemporal receptive field model explains responses of area MT neurons to naturalistic movies.](http://www.jneurosci.org/content/31/41/14551.long) J Neurosci. 31(41):14551-64. (2011)

