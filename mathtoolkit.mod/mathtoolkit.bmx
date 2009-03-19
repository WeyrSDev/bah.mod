' Copyright (c) 2009 Bruce A Henderson
' All rights reserved.
'
' Redistribution and use in source and binary forms, with or without
' modification, are permitted provided that the following conditions are met:
'     * Redistributions of source code must retain the above copyright
'       notice, this list of conditions and the following disclaimer.
'     * Redistributions in binary form must reproduce the above copyright
'       notice, this list of conditions and the following disclaimer in the
'       documentation and/or other materials provided with the distribution.
'     * Neither the name of Bruce A Henderson nor the
'       names of its contributors may be used to endorse or promote products
'       derived from this software without specific prior written permission.
'
' THIS SOFTWARE IS PROVIDED BY Bruce A Henderson ``AS IS'' AND ANY
' EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
' WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
' DISCLAIMED. IN NO EVENT SHALL Bruce A Henderson BE LIABLE FOR ANY
' DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
' (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
' LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
' ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
' SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
'
SuperStrict

Rem
bbdoc: Math Toolkit
End Rem
Module BaH.MathToolkit

ModuleInfo "Version: 1.00"
ModuleInfo "License: BSD"
ModuleInfo "Copyright: Wrapper - 2009 Bruce A Henderson"

ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release."

ModuleInfo "CC_OPTS: -fexceptions"


Import "common.bmx"



Rem
bbdoc: Returns i!.
about: If @i is so large that the result can not be represented in a double, then throws TOverflowException.
End Rem
Function Factorial:Double(i:Int)
	Return bmx_boost_math_factorial(i)
End Function

Rem
bbdoc: Returns i!.
about: Internally this function performs table lookup of the result. Further it performs no range checking on the value of i:
it is up to the caller to ensure that i <= MaxFactorial(). This function is intended to be used inside inner loops that require
fast table lookup of factorials, but requires care to ensure that argument i never grows too large.
<p>
If @i is so large that the result can not be represented in a double, then throws TOverflowException.
</p>
End Rem
Function UncheckedFactorial:Double(i:Int)
	Return bmx_boost_math_uncheckedfactorial(i)
End Function

Rem
bbdoc: Defines the largest value that can be passed to UncheckedFactorial().
about: The value can be used where integral constant expressions are required: for example to define the size of
further tables that depend on the factorials.
End Rem
Function MaxFactorial:Int()
	Return bmx_boost_math_maxfactorial()
End Function

Rem
bbdoc: Returns i!!.
about: May throw TOverflowException if the result is too large to be represented by a Double. The implementation is designed to
be optimised for small @i where table lookup of @i! is possible.
<p>
The double factorial is implemented in terms of the factorial and gamma
functions using the relations:
</p>
<p>
(2n)!! = 2<sup>n </sup> * n!
</p>
<p>
(2n+1)!! = (2n+1)! / (2<sup>n </sup> n!)
</p>
<p>
and
</p>
<p>
(2n-1)!! = &#915;((2n+1)/2) * 2<sup>n </sup> / sqrt(pi)
</p>
End Rem
Function DoubleFactorial:Double(i:Int)
	Return bmx_boost_math_doublefactorial(i)
End Function

Rem
bbdoc: Returns the rising factorial of @x and @i.
about: rising_factorial(x, i) = &#915;(x + i) / &#915;(x);
<p>
or
</p>
<p>
rising_factorial(x, i) = x(x+1)(x+2)(x+3)...(x+i)
</p>
<p>
Note that both @x and @i can be negative as well as positive.
</p>
<p>
May throw TOverflowException if the result is too large to be represented by a Double.
</p>
End Rem
Function RisingFactorial:Double(x:Double, i:Int)
	Return bmx_boost_math_risingfactorial(x, i)
End Function

Rem
bbdoc: Returns the falling factorial of @x and @i.
about: falling_factorial(x, i) = x(x-1)(x-2)(x-3)...(x-i+1)
<p>
Note that this function is only defined for positive @i, hence the unsigned second argument. Argument @x can be either positive
or negative however.
</p>
<p>
May throw TOverflowException if the result is too large to be represented by a Double.
</p>
End Rem
Function FallingFactorial:Double(x:Double, i:Int)
	Return bmx_boost_math_fallingfactorial(x, i)
End Function

Rem
bbdoc: Returns the binomial coefficient: <sub>n</sub>C<sub>k</sub>.
about: Requires k <= n.
<p>
May throw TOverflowException if the result is too large to be represented by a Double.
</p>
End Rem
Function BinomialCoefficient:Double(n:Int, k:Int)
	Return bmx_boost_math_binomialcoefficient(n, k)
End Function

Rem
bbdoc: Returns the cubed root of @x: x<sup>1/3</sup>.
about: Implemented using Halley iteration.
<p>
The following graph illustrates the behaviour of cbrt:
</p>
<p>
<img src="cbrt.png" align="center">
</p>
End Rem
Function Cbrt:Double(x:Double)
	Return bmx_boost_math_cbrt(x)
End Function

Rem
bbdoc: Computes <img src="hypot.png">in such a way as to avoid undue underflow and overflow.
about: When calculating <img src="hypot.png"> it's quite easy for the intermediate terms to
either overflow or underflow, even though the result is in fact perfectly representable.
End Rem
Function Hypot:Double(x:Double, y:Double)
	Return bmx_boost_math_hypot(x, y)
End Function

Function Log1p:Double(x:Double)
' TODO
End Function

Function Expm1:Double(x:Double)
' TODO
End Function

Function Sqrt1pm1:Double(x:Double)
' TODO
End Function

Function Powm1:Double(x:Double, y:Double)
' TODO
End Function


Rem
bbdoc: 
End Rem
Function Mean:Double(dist:TDistribution)
	Return dist.Mean()
End Function

Rem
bbdoc: 
End Rem
Function Mode:Double(dist:TDistribution)
	Return dist.Mode()
End Function

Rem
bbdoc: 
End Rem
Function StandardDeviation:Double(dist:TDistribution)
	Return dist.StandardDeviation()
End Function

Rem
bbdoc: 
End Rem
Function Skewness:Double(dist:TDistribution)
	Return dist.Skewness()
End Function

Rem
bbdoc: 
End Rem
Function Pdf:Double(dist:TDistribution, k:Double)
	Return dist.Pdf(k)
End Function

Rem
bbdoc: 
End Rem
Function Cdf:Double(dist:TDistribution, k:Double)
	Return dist.Cdf(k)
End Function


Rem
bbdoc: 
End Rem
Type TDistribution

	Field objectPtr:Byte Ptr
	
	Method Mean:Double() Abstract
	Method Mode:Double() Abstract
	Method StandardDeviation:Double() Abstract
	Method Skewness:Double() Abstract
	Method Pdf:Double(k:Double) Abstract
	Method Cdf:Double(k:Double) Abstract

End Type

Rem
bbdoc: Represents a <a href="http://mathworld.wolfram.com/BinomialDistribution.html">binomial distribution</a>.
about: It is used when there are exactly two mutually exclusive outcomes of a trial. These outcomes are
labelled "success" and "failure". The binomial distribution is used to obtain the probability of observing @k
successes in @N trials, with the probability of success on a single trial denoted by p. The binomial
distribution assumes that p is fixed for all trials.
          </p>
<table border="0" summary="Note">
<tr>
<th align="left">Note</th>
</tr>
<tr><td align="left" valign="top">
<p>
The random variable for the binomial distribution is the number of
successes, (the number of trials is a fixed property of the distribution)
whereas for the negative binomial, the random variable is the number
of trials, for a fixed number of successes.
</p>
</td></tr>
</table>
<p>
The PDF for the binomial distribution is given by:
</p>
<p>
<img src="binomial_ref2.png">
</p>
<p>
The following two graphs illustrate how the PDF changes depending upon
the distributions parameters, first we'll keep the success fraction
<em>p</em> fixed at 0.5, and vary the sample size:
</p>
<p>
<img src="binomial_pdf_1.png" align="middle">
</p>
<p>
Alternatively, we can keep the sample size fixed at N=20 and vary the
success fraction <em>p</em>:
</p>
<p>
<img src="binomial_pdf_2.png" align="middle">
</p>
<table border="0" summary="Caution">
<tr>
<th align="left">Caution</th>
</tr>
<tr><td align="left" valign="top">
<p>
The Binomial distribution is a discrete distribution: internally functions like the <tt>cdf</tt> and
<tt>pdf</tt> are treated "as if" they are continuous functions, but in reality the
results returned from these functions only have meaning if an integer
value is provided for the random variate argument.
</p>
<p>
The quantile function will by default return an integer result that
has been <em>rounded outwards</em>. That is to say lower
quantiles (where the probability is less than 0.5) are rounded downward,
and upper quantiles (where the probability is greater than 0.5) are
rounded upwards. This behaviour ensures that if an X% quantile is
requested, then <em>at least</em> the requested coverage
will be present in the central region, and <em>no more than</em>
the requested coverage will be present in the tails.
</p>
</td></tr>
</table>
End Rem
Type TBinomial Extends TDistribution

	Rem
	bbdoc: Creates a new TBinomial instance.
	about: n is the total number of trials, p  is the probability of success of a single trial.
	<p>
	Requires 0 <= p <= 1, and n >= 0, otherwise throws TDomainException. 
	</p>
	End Rem
	Function CreateBinomial:TBinomial(n:Int, p:Double)
		Return New TBinomial.Create(n, p)
	End Function
	
	Rem
	bbdoc: Creates a new TBinomial instance.
	about: n is the total number of trials, p  is the probability of success of a single trial.
	<p>
	Requires 0 <= p <= 1, and n >= 0, otherwise throws TDomainException. 
	</p>
	End Rem
	Method Create:TBinomial(n:Int, p:Double)
		objectPtr = bmx_boost_math_binomial_distribution_create(n, p)
		Return Self
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method SuccessFraction:Double()
		Return bmx_boost_math_binomial_distribution_successfraction(objectPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method Trials:Int()
		Return bmx_boost_math_binomial_distribution_trials(objectPtr)
	End Method
	
	Method Mean:Double()
		Return bmx_boost_math_binomial_distribution_mean(objectPtr)
	End Method

	Method Mode:Double()
		Return bmx_boost_math_binomial_distribution_mode(objectPtr)
	End Method
	
	Method StandardDeviation:Double()
		Return bmx_boost_math_binomial_distribution_standarddeviation(objectPtr)
	End Method

	Method Skewness:Double()
		Return bmx_boost_math_binomial_distribution_skewness(objectPtr)
	End Method

	Method Pdf:Double(k:Double)
		Return bmx_boost_math_binomial_distribution_pdf(objectPtr, k)
	End Method
	
	Method Cdf:Double(k:Double)
		Return bmx_boost_math_binomial_distribution_cdf(objectPtr, k)
	End Method

End Type






