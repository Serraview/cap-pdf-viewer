package com.eptura.cap.pdfviewer;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "PdfViewer")
public class PdfViewerPlugin extends Plugin {

    private PdfViewer implementation = new PdfViewer();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void present(PluginCall call) {
        String url = call.getString("url");
        call.resolve(null);
    }
}
