function runner(scale)
%%
%% Driver for the N-body problem coded using 1d arrays for the
%% displacement vectors.
%%

seed=1;

n=round(scale^.4*30); %floor(28*rand);
dT=(.5)*0.0833;
T=(.5)*32.4362*sqrt(scale);
Rx=rand1(n, 1, .1)*1000.23;
Ry=rand1(n, 1, .4)*1000.23;
Rz=rand1(n, 1, .9)*1000.23;

m=rand1(n, 1, -.4)*345;

tic();
[Fx, Fy, Fz, Vx, Vy, Vz]=nbody1d(n, Rx, Ry, Rz, m, dT, T);
elapsed = toc();

Fx_exps = floor(log(abs(Fx)));
Fy_exps = floor(log(abs(Fy)));
Fz_exps = floor(log(abs(Fz)));
Vx_exps = floor(log(abs(Vx)));
Vy_exps = floor(log(abs(Vy)));
Vz_exps = floor(log(abs(Vz)));

checksum = fletcherSum(Fx_exps) +...
    fletcherSum(Fy_exps) +...
    fletcherSum(Fz_exps) +...
    fletcherSum(Vx_exps) +...
    fletcherSum(Vy_exps) +...
    fletcherSum(Vz_exps);

disp('{');
disp('"time":');
disp(elapsed);
disp(', "output":');
disp(checksum);
disp('}');

end
