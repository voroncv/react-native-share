package cl.json.social;

import android.content.ActivityNotFoundException;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableMap;

public class OdnoklassnikiShare extends SingleShareIntent {

    private static final String PACKAGE = "ru.ok.android";
    private static final String DEFAULT_WEB_LINK = "https://connect.ok.ru/offer?url={url}&title={title}&description={message}";
    private static final String PLAY_STORE_LINK = "market://details?id=ru.ok.android";

    public OdnoklassnikiShare(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public void open(ReadableMap options) throws ActivityNotFoundException {
        super.open(options);
        //  extra params here
        this.openIntentChooser();
    }

    @Override
    protected String getPackage() {
        return PACKAGE;
    }

    @Override
    protected String getDefaultWebLink() {
        return DEFAULT_WEB_LINK;
    }

    @Override
    protected String getPlayStoreLink() {
        return PLAY_STORE_LINK;
    }
}
