## OpenCV.js 4 with Bioinspired
### JS
https://github.com/scharger/opencvjs_bioinspired/blob/4.x/js_dist/opencv.js

### For detailed information see:
https://github.com/scharger/opencvjs_bioinspired/blob/4.x/platforms/js/opencv_js.config.py

Also, you can configure required modules (some turned off):
https://github.com/scharger/opencvjs_bioinspired/blob/4.x/platforms/js/build_js.py (93 - 138)

### Usage example
```js
function retinaExample(inputMat) {
	this.retinaConfig = {
		OPLandIPLparvo : {
			colorMode : false,
			normaliseOutput : true,
			photoreceptorsLocalAdaptationSensitivity : 0.75,
			photoreceptorsTemporalConstant : 0.9,
			photoreceptorsSpatialConstant : 0.53,
			horizontalCellsGain : 0.01,
			HcellsTemporalConstant : 0.5,
			HcellsSpatialConstant : 7,
			ganglionCellsSensitivity : 0.75,
		}, 
		IPLmagno : {
			normaliseOutput : true,
			parasolCells_beta : 0,
			parasolCells_tau : 0,
			parasolCells_k : 7,
			amacrinCellsTemporalCutFrequency : 2,
			V0CompressionParameter : 0.95,
			localAdaptintegration_tau : 0,
			localAdaptintegration_k : 7
		}
	}
	
	this.init = function(inputMat) {
		this.inputMat 				= inputMat;
		this.retinaOutput_magno 	= new cv.Mat(height, width, cv.CV_8UC4);
		this.retinaOutput_parvo 	= new cv.Mat(height, width, cv.CV_8UC4);
		this.retina 				= new cv.bioinspired_Retina(
			this.retinaOutput_magno.size(),
			false,
			cv.RETINA_COLOR_DIAGONAL,
			false,
			1.0,
			10.0
		);

		this.setupRetina(this.retinaConfig);
		this.retina.clearBuffers();
	}
	
	this.perform = function() {
		this.retina.run(this.inputMat);
		this.retina.getMagno(this.retinaOutput_magno);
		this.retina.getParvo(this.retinaOutput_parvo);
		
		return {
			magno: this.retinaOutput_magno,
			parvo: this.retinaOutput_parvo
		}
	}

	this.setupRetina = function(params) {
		if (typeof params !== "object") {
			return;
		}

		if (typeof params.OPLandIPLparvo !== "object") {
			params.OPLandIPLparvo = {};
		}

		if (typeof params.IPLmagno !== "object") {
			params.IPLmagno = {};
		}

		this.retina.setupOPLandIPLParvoChannel(
			params.OPLandIPLparvo.colorMode,
			params.OPLandIPLparvo.normaliseOutput,
			params.OPLandIPLparvo.photoreceptorsLocalAdaptationSensitivity,
			params.OPLandIPLparvo.photoreceptorsTemporalConstant,
			params.OPLandIPLparvo.photoreceptorsSpatialConstant,
			params.OPLandIPLparvo.horizontalCellsGain,
			params.OPLandIPLparvo.HcellsTemporalConstant,
			params.OPLandIPLparvo.HcellsSpatialConstant,
			params.OPLandIPLparvo.ganglionCellsSensitivity
		);

		this.retina.setupIPLMagnoChannel(
			params.IPLmagno.normaliseOutput,
			params.IPLmagno.parasolCells_beta,
			params.IPLmagno.parasolCells_tau,
			params.IPLmagno.parasolCells_k,
			params.IPLmagno.amacrinCellsTemporalCutFrequency,
			params.IPLmagno.V0CompressionParameter,
			params.IPLmagno.localAdaptintegration_tau,
			params.IPLmagno.localAdaptintegration_k
		);
	}
	
	this.init(inputMat);
}

var retina = new retinaExample(input_mat);
var result = retina.perform();
````



## OpenCV: Open Source Computer Vision Library

### Resources

* Homepage: <https://opencv.org>
  * Courses: <https://opencv.org/courses>
* Docs: <https://docs.opencv.org/4.x/>
* Q&A forum: <https://forum.opencv.org>
  * previous forum (read only): <http://answers.opencv.org>
* Issue tracking: <https://github.com/opencv/opencv/issues>
* Additional OpenCV functionality: <https://github.com/opencv/opencv_contrib> 


### Contributing

Please read the [contribution guidelines](https://github.com/opencv/opencv/wiki/How_to_contribute) before starting work on a pull request.

#### Summary of the guidelines:

* One pull request per issue;
* Choose the right base branch;
* Include tests and documentation;
* Clean up "oops" commits before submitting;
* Follow the [coding style guide](https://github.com/opencv/opencv/wiki/Coding_Style_Guide).
