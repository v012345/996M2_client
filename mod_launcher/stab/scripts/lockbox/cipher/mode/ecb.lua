

local Array = require("lockbox.util.array");
local Stream = require("lockbox.util.stream");
local Queue = require("lockbox.util.queue");

local ECB = {};

ECB.Cipher = function()

    local public = {};

    local key;
    local blockCipher;
    local padding;
    local inputQueue;
    local outputQueue;

    public.setKey = function(keyBytes)
        key = keyBytes;
        return public;
    end

    public.setBlockCipher = function(cipher)
        blockCipher = cipher;
        return public;
    end

    public.setPadding = function(paddingMode)
        padding = paddingMode;
        return public;
    end

    public.init = function()
        inputQueue = Queue();
        outputQueue = Queue();
        return public;
    end

    public.update = function(messageStream)
        local byte = messageStream();
        while (byte ~= nil) do
            inputQueue.push(byte);
            if(inputQueue.size() >= blockCipher.blockSize) then
                local block = Array.readFromQueue(inputQueue, blockCipher.blockSize);

                block = blockCipher.encrypt(key, block);

                Array.writeToQueue(outputQueue, block);
            end
            byte = messageStream();
        end
        return public;
    end

    public.finish = function()
        local paddingStream = padding(blockCipher.blockSize, inputQueue.getHead());
        public.update(paddingStream);

        return public;
    end

    public.getOutputQueue = function()
        return outputQueue;
    end

    public.asHex = function()
        return Stream.toHex(outputQueue.pop);
    end

    public.asBytes = function()
        return Stream.toArray(outputQueue.pop);
    end

    return public;

end

ECB.Decipher = function()

    local public = {};

    local key;
    local blockCipher;
    local padding;
    local inputQueue;
    local outputQueue;

    public.setKey = function(keyBytes)
        key = keyBytes;
        return public;
    end

    public.setBlockCipher = function(cipher)
        blockCipher = cipher;
        return public;
    end

    public.setPadding = function(paddingMode)
        padding = paddingMode;
        return public;
    end

    public.init = function()
        inputQueue = Queue();
        outputQueue = Queue();
        return public;
    end

    public.update = function(messageStream)
        local byte = messageStream();
        while (byte ~= nil) do
            inputQueue.push(byte);
            if(inputQueue.size() >= blockCipher.blockSize) then
                local block = Array.readFromQueue(inputQueue, blockCipher.blockSize);

                block = blockCipher.decrypt(key, block);

                Array.writeToQueue(outputQueue, block);
            end
            byte = messageStream();
        end
        return public;
    end

    public.finish = function()
        -- local paddingStream = padding(blockCipher.blockSize, inputQueue.getHead());
        -- public.update(paddingStream);
-----------------------------------------------------
         local data=Stream.toArray(outputQueue.pop) 
         local paddingByte=data[#data]
         local realLength=#data-paddingByte--如果有padding,计算去除padding后的长度
          local padded=true
          for i=#data,realLength+1,-1 do
              if(data[i]~=paddingByte) then
                  padded=false
              end
          end
          print("realLength is "..realLength)
          local paddedBytes=Array.slice(data,1,realLength)

          if padded then
              Array.writeToQueue(outputQueue,paddedBytes)
          end

---------------------------------------------------
        return public;
    end

    public.getOutputQueue = function()
        return outputQueue;
    end

    public.asHex = function()
        return Stream.toHex(outputQueue.pop);
    end

    public.asBytes = function()
        return Stream.toArray(outputQueue.pop);
    end

    return public;

end


return ECB;
