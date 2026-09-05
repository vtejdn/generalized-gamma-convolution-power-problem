# Jensen obstruction: a proposed analytic disproof of SD

## Status and provenance

This note contains a **new deduction made in this dossier**, not a theorem located in the published literature.  The only external distributional input is the positive Laplace-mixture formula for the characteristic function from Yano--Yano--Yor, Proposition 2.11, and Wang, Lemma 2.7.  The background-driving criterion is due to Jurek--Vervaat/Sato.

The argument was first found by specializing to \(\alpha=3/2\), but the same calculation works without change for every \(1<\alpha<2\).

## 1. The \(\alpha=3/2\) case

For \(t\ge0\), normalize the Wang--YYY mixture as

\[
\varphi_{3/2}(t)
=\kappa\int_0^\infty e^{-ty}
\frac{y^{3/2}}{1-\sqrt2\,y^{3/2}+y^3}\,dy,
\]

where \(\kappa>0\) is chosen so that \(\varphi_{3/2}(0)=1\).  Put

\[
p=\frac52,
\qquad
H(y)=\frac1{1-\sqrt2\,y^{3/2}+y^3},
\qquad
A=\kappa\Gamma(5/2).
\]

After the substitution \(z=ty\),

\[
F(t):=\frac{t^{5/2}\varphi_{3/2}(t)}A
=\frac1{\Gamma(5/2)}
\int_0^\infty e^{-z}z^{3/2}H(z/t)\,dz
=E[H(Z/t)],
\]

where \(Z\sim\Gamma_{5/2}\).

Let

\[
q(t)=-t\frac{\varphi_{3/2}'(t)}{\varphi_{3/2}(t)},
\qquad
J(t)=1-\frac{q(t)}{5/2}.
\]

Then

\[
J(t)=\frac{2t}{5}\frac{d}{dt}\log F(t).
\]

The endpoint asymptotics imply \(J\in L^1(0,\infty)\),

\[
\lim_{t\downarrow0}t\log F(t)=0,
\qquad
\lim_{t\to\infty}t\log F(t)=0.
\]

Integration by parts therefore gives

\[
\int_0^\infty J(t)\,dt
=-\frac25\int_0^\infty\log F(t)\,dt.
\tag{1}
\]

Strict concavity of the logarithm gives, for every \(t>0\),

\[
\log F(t)=\log E[H(Z/t)]
>E[\log H(Z/t)].
\tag{2}
\]

The inequality is strict because \(Z\) is nondegenerate and \(H\) is nonconstant.  Moreover, absolute Fubini is valid because

\[
E\int_0^\infty|\log H(Z/t)|\,dt
=E[Z]\int_0^\infty\frac{|\log H(y)|}{y^2}\,dy<\infty.
\]

The key cancellation is

\[
\int_0^\infty\frac{\log H(y)}{y^2}\,dy=0.
\tag{3}
\]

Indeed,

\[
1-\sqrt2\,y^{3/2}+y^3
=(1+e^{3\pi i/4}y^{3/2})
\,(1+e^{-3\pi i/4}y^{3/2}).
\]

For \(|\arg a|<\pi\), integration by parts followed by the beta integral gives

\[
\int_0^\infty\frac{\operatorname{Log}(1+a y^{3/2})}{y^2}\,dy
=\frac{\pi a^{2/3}}{\sin(2\pi/3)}.
\tag{4}
\]

For \(a=e^{\pm3\pi i/4}\), the principal powers are \(a^{2/3}=e^{\pm\pi i/2}=\pm i\).  The two terms in (4) cancel, proving (3).

Integrating (2) and using (3) yields

\[
\int_0^\infty\log F(t)\,dt>0.
\]

By (1),

\[
\boxed{\int_0^\infty J(t)\,dt<0.}
\tag{5}
\]

If \(C_{3/2}\) were SD, its bounded background-driving exponent \(q\) would be compound Poisson.  Its intensity is \(5/2\): indeed, if

\[
q(t)=\int_{\mathbb R}(1-\cos(tx))\,\nu(dx),
\]

then the Cesàro mean of \(q(t)\) tends to \(\nu(\mathbb R)\), while the ordinary limit of \(q(t)\) is \(5/2\).  Hence \(J=1-q/(5/2)\) would be the characteristic function of one jump.  But an integrable characteristic function has a continuous nonnegative inverse-Fourier density, whereas (5) would give

\[
r(0)=\frac1\pi\int_0^\infty J(t)\,dt<0.
\]

This contradiction proves

\[
\boxed{C_{3/2}\notin SD.}
\]

No numerical sign computation is used in this proof.

## 2. Generalization to every \(1<\alpha<2\)

Let

\[
\theta=\frac{\pi\alpha}{2},
\qquad
p=\alpha+1,
\qquad
H_\alpha(y)=
\frac1{1+2\cos\theta\,y^\alpha+y^{2\alpha}}.
\]

The normalized mixture is

\[
\varphi_\alpha(t)
=\kappa_\alpha\int_0^\infty
e^{-ty}y^\alpha H_\alpha(y)\,dy.
\]

With \(A_\alpha=\kappa_\alpha\Gamma(p)\) and \(Z\sim\Gamma_p\), set

\[
F_\alpha(t)
=\frac{t^p\varphi_\alpha(t)}{A_\alpha}
=E[H_\alpha(Z/t)].
\]

Exactly as above,

\[
J_\alpha(t)
=1+\frac{t}{p}\frac{\varphi_\alpha'(t)}{\varphi_\alpha(t)}
=\frac{t}{p}(\log F_\alpha(t))'
\]

and

\[
\int_0^\infty J_\alpha(t)\,dt
=-\frac1p\int_0^\infty\log F_\alpha(t)\,dt.
\tag{6}
\]

For \(|\arg a|<\pi\), the general form of (4) is

\[
I_\alpha(a)
:=\int_0^\infty
\frac{\operatorname{Log}(1+a y^\alpha)}{y^2}\,dy
=\frac{\pi a^{1/\alpha}}{\sin(\pi/\alpha)}.
\tag{7}
\]

To verify (7), integrate by parts and use

\[
a\alpha\int_0^\infty
\frac{y^{\alpha-2}}{1+a y^\alpha}\,dy
=\frac{\pi a^{1/\alpha}}{\sin(\pi/\alpha)};
\]

the complex statement follows by analytic continuation in the slit plane.

Since

\[
1+2\cos\theta\,y^\alpha+y^{2\alpha}
=(1+e^{i\theta}y^\alpha)(1+e^{-i\theta}y^\alpha)
\]

and

\[
(e^{\pm i\theta})^{1/\alpha}
=e^{\pm i\pi/2}=\pm i,
\]

(7) gives the exact cancellation

\[
\int_0^\infty
\frac{\log H_\alpha(y)}{y^2}\,dy=0.
\tag{8}
\]

Strict Jensen and absolute Fubini now give

\[
\int_0^\infty\log F_\alpha(t)\,dt>0.
\]

Equation (6) then implies that the inverse Fourier transform of \(J_\alpha\) is negative at zero.  Hence the proposed general conclusion is

\[
\boxed{C_\alpha\notin SD,
\qquad1<\alpha<2.}
\]

Combining this with the stable endpoint gives

\[
\boxed{C_\alpha\in SD
\iff \alpha=2,
\qquad 1<\alpha\le2.}
\]

## 3. Integrability and endpoint checks

At infinity,

\[
H_\alpha(y)=1-2\cos\theta\,y^\alpha+O(y^{2\alpha})
\qquad(y\downarrow0),
\]

so

\[
F_\alpha(t)
=1+D_\alpha t^{-\alpha}+O(t^{-2\alpha}),
\qquad
D_\alpha=-2\cos\theta
\frac{\Gamma(2\alpha+1)}{\Gamma(\alpha+1)}>0,
\]

and \(J_\alpha(t)=O(t^{-\alpha})\).  Near zero, the mixing density is asymptotic to a constant times \(y^{-\alpha}\), which gives \(q_\alpha(t)=O(t^{\alpha-1})\) and \(J_\alpha(t)\to1\).  Thus \(J_\alpha\in L^1(0,\infty)\).

Also,

\[
\log F_\alpha(t)=p\log t+O(1)\qquad(t\downarrow0),
\qquad
\log F_\alpha(t)=O(t^{-\alpha})\qquad(t\to\infty),
\]

which justifies (6).  The argument excludes \(\alpha=2\): the positive mixing density degenerates there, and \(q_2(t)=|t|\) is unbounded.  This is consistent with the Cauchy law being stable and SD.

## 4. References

- K. Yano, Y. Yano and M. Yor (2009), Proposition 2.11, *On the laws of first hitting times of points for one-dimensional symmetric stable Lévy processes*, arXiv:0811.2046.
- M. Wang (2026), Lemma 2.7, *Infinite divisibility of \(\alpha\)-Cauchy distributions*, arXiv:2512.23164v3 and the supplied ECP page proof.
- Z. J. Jurek and W. Vervaat (1983), *An integral representation for self-decomposable Banach space valued random variables*, DOI: 10.1007/BF00538800.
- K. Sato (1999), *Lévy Processes and Infinitely Divisible Distributions*, Cambridge University Press.
