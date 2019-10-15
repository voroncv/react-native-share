package cl.json.social;

import android.content.ActivityNotFoundException;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableMap;

/**
 * Created by disenodosbbcl on 23-07-16.
 */
public class VkontakteShare extends SingleShareIntent {

    private static final String PACKAGE = "com.vkontakte.android";
    private static final String DEFAULT_WEB_LINK = "https://vk.com/share.php?url={url}&title={title}&comment={message}";
    private static final String PLAY_STORE_LINK = "market://details?id=com.vkontakte.android";

    public VkontakteShare(ReactApplicationContext reactContext) {
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
