package com.g2ssid.ddh_g2ssid_api.serialization;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;

import java.io.IOException;

/**
 * @author giovanny delgadillo
 */
public class EnumSerializer<E extends EnumSerializable> extends StdSerializer<E> {

    protected EnumSerializer(Class<E> t) {
        super(t);
    }

    @Override
    public void serialize(E enumSerializable, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        jsonGenerator.writeStartObject();
        jsonGenerator.writeFieldName("key");
        jsonGenerator.writeString(enumSerializable.getKey());
        jsonGenerator.writeFieldName("value");
        jsonGenerator.writeString(enumSerializable.getValue());
        jsonGenerator.writeEndObject();
    }
}
