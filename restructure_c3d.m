function [struct_c3d] = restructure_c3d(c3d)

struct_c3d=struct();

struct_c3d.FirstFrame=c3d.header.points.firstFrame;
struct_c3d.LastFrame=c3d.header.points.lastFrame;
struct_c3d.Frequency=c3d.parameters.POINT.RATE.DATA;
struct_c3d.AnalogFrequency=c3d.parameters.ANALOG.RATE.DATA;
struct_c3d.Events=get_events(c3d);
struct_c3d.EMG=get_emg(c3d);
struct_c3d.Loads=get_loads(c3d);
struct_c3d.Angles=get_angles(c3d);
struct_c3d.Markers=get_markers(c3d);
struct_c3d.Kinetics=get_kinetics(c3d);

end