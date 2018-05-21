require("tiro")

Nave = {
    largura = 64,
    altura = 64,
    tiros = {}
}

-- construtor
function Nave:new (obj, posx, posy, img)
  obj = obj or {}
  setmetatable(obj, self)
  self.__index = self
  self.x = posx - self.largura/2 or 0 --seta posição no meio da tela
  self.y = posy - self.altura or 0 --seta nave na posição inferior
  self.imagem_src = img
  return obj
end


function Nave:move(largura_tela, altura_tela)
  if love.keyboard.isDown('w') or love.keyboard.isDown('up') and self.y >=0 then
      self.y = self.y - 2
  end
  if love.keyboard.isDown('s') or love.keyboard.isDown('down') and self.y < altura_tela - self.altura then
      self.y = self.y + 2
  end
  if love.keyboard.isDown('a') or love.keyboard.isDown('left') and self.x >= 0 then
      self.x = self.x - 2
  end
  if love.keyboard.isDown('d') or love.keyboard.isDown('right') and self.x < largura_tela - self.largura  then
      self.x = self.x + 2
  end
end

function Nave:atira()
  local tiro = criaTiro(self.x+self.largura/2-8, self.y-8)
  
  table.insert(self.tiros, tiro)
end

return Nave