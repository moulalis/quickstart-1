package org.jboss.narayana.quickstarts.wsat.jtabridge.second.jaxws;

import javax.xml.namespace.QName;
import jakarta.xml.ws.Service;
import jakarta.xml.ws.WebEndpoint;
import jakarta.xml.ws.WebServiceClient;
import jakarta.xml.ws.WebServiceFeature;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.6 in JDK 6 Generated source version: 2.1
 * 
 */
@WebServiceClient(name = "SecondServiceATService", targetNamespace = "http://www.jboss.org/narayana/quickstarts/wsat/simple/second")
public class SecondServiceATService extends Service {

    private final static URL SECONDSERVICEATSERVICE_WSDL_LOCATION;
    private final static Logger logger = Logger.getLogger(SecondServiceATService.class.getName());

    static {
        URL url = null;
        try {
            URL baseUrl;
            baseUrl = SecondServiceATService.class.getResource(".");
            url = new URL(baseUrl, "SecondServiceAT.wsdl");
        } catch (MalformedURLException e) {
            logger.warning("Failed to create URL for the wsdl Location: 'SecondServiceAT.wsdl', retrying as a local file");
            logger.warning(e.getMessage());
        }
        SECONDSERVICEATSERVICE_WSDL_LOCATION = url;
    }

    public SecondServiceATService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public SecondServiceATService() {
        super(SECONDSERVICEATSERVICE_WSDL_LOCATION, new QName(
                "http://www.jboss.org/narayana/quickstarts/wsat/simple/Second", "SecondServiceATService"));
    }

    /**
     * 
     * @return returns SecondServiceAT
     */
    @WebEndpoint(name = "SecondServiceAT")
    public SecondServiceAT getSecondServiceAT() {
        return super.getPort(
                new QName("http://www.jboss.org/narayana/quickstarts/wsat/simple/Second", "SecondServiceAT"),
                SecondServiceAT.class);
    }

    /**
     * 
     * @param features A list of {@link jakarta.xml.ws.WebServiceFeature} to configure on the proxy. Supported features not in the
     *        <code>features</code> parameter will have their default values.
     * @return returns SecondServiceAT
     */
    @WebEndpoint(name = "SecondServiceAT")
    public SecondServiceAT getSecondServiceAT(WebServiceFeature... features) {
        return super.getPort(
                new QName("http://www.jboss.org/narayana/quickstarts/wsat/simple/Second", "SecondServiceAT"),
                SecondServiceAT.class, features);
    }

}